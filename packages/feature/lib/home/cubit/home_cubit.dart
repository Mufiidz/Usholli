import 'dart:async';

import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/model/calendar_today.dart';
import 'package:domain/model/prayer_time.dart';
import 'package:domain/usecase/base_usecase.dart';

part 'home_cubit.mapper.dart';
part 'home_state.dart';

@injectable
class HomeCubit extends BaseCubit<HomeState, HomeEffect> {
  final GetCityNameUseCase _getCityNameUseCase;
  final GetPrayertimeTodayUsecase _getPrayertimeTodayUsecase;
  final GetNextPrayerUsecase _getNextPrayerUsecase;
  final CalendarTodayUseCase _calendarTodayUseCase;
  Timer? _countdownPrayer;

  HomeCubit(
    this._getCityNameUseCase,
    this._getPrayertimeTodayUsecase,
    this._getNextPrayerUsecase,
    this._calendarTodayUseCase,
  ) : super(HomeState());

  void init() async {
    emit(state.copyWith(statusStateScreen: StatusStateScreen.loading));
    try {
      final cityResult = await _getCityNameUseCase.safeExecute(NoParam());
      if (cityResult.isError) throw cityResult.exception;
      final cityName = cityResult.onDataResult;

      emit(state.copyWith(city: cityName));

      final (prayerResult, nextPrayerResult, calendarTodayResult) = await (
        _getPrayertimeTodayUsecase.safeExecute(cityName),
        // Future.delayed(Duration(seconds: 5), () => ErrorResult('Disabled Prayer Time')),
        _getNextPrayerUsecase.safeExecute(cityName),
        // Future.delayed(Duration(seconds: 2), () => ErrorResult('Disabled Prayer Time')),
        Future.delayed(Duration(seconds: 1), () => DataResult<CalendarToday?>(null)),
        // _calendarTodayUseCase.safeExecute(NoParam()),
      ).wait;

      final prayerSchedule = prayerResult.when(
        result: (data) => data,
        error: (message, exception) {
          return null;
        },
      );

      final prayerTime = nextPrayerResult.when(
        result: (data) => data,
        error: (message, exception) {
          return null;
        },
      );

      final calendarToday = calendarTodayResult.when(
        result: (data) => data,
        error: (message, exception) {
          return null;
        },
      );

      if (prayerSchedule == null && prayerTime == null && calendarToday == null) {
        throw ErrorException('Failed to get data');
      }
      emit(
        state.copyWith(
          statusStateScreen: StatusStateScreen.success,
          prayerTime: prayerSchedule,
          nextPrayerTime: prayerTime,
          calendarToday: calendarToday,
        ),
      );

      startCountDownPrayer();
    } on BaseException catch (e) {
      emit(state.copyWith(statusStateScreen: StatusStateScreen.failure, message: e.message));
    } catch (e) {
      emit(state.copyWith(statusStateScreen: StatusStateScreen.failure, message: 'Error'));
    }
  }

  void startCountDownPrayer() {
    _countdownPrayer?.cancel();

    _countdownPrayer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      final DateTime now = DateTime.now();
      DateTime? nextPrayerTime = state.nextPrayerTime?.time;
      if (nextPrayerTime == null) {
        timer.cancel();
        return;
      }
      final Duration remaining = nextPrayerTime.difference(now);

      if (remaining.isNegative) {
        timer.cancel();
        emit(state.copyWith(countdownPrayer: '"Waktunya Salat!"'));
        final nextPrayerTimeResult = await _getNextPrayerUsecase.safeExecute(state.city);
        nextPrayerTimeResult.when(
          result: (data) => emit(state.copyWith(nextPrayerTime: data)),
          error: (message, exception) {
            emit(state.copyWith(countdownPrayer: null));
            emitEffect(HomeEffect.showSnackBar(message));
          },
        );

        if (nextPrayerTimeResult.isSuccess) {
          startCountDownPrayer();
        }

        return;
      }

      final hours = remaining.inHours.toString().padLeft(2, '0');
      final minutes = (remaining.inMinutes % 60).toString().padLeft(2, '0');
      final seconds = (remaining.inSeconds % 60).toString().padLeft(2, '0');

      emit(state.copyWith(countdownPrayer: '$hours:$minutes:$seconds'));
    });
  }

  @override
  Future<void> close() {
    _countdownPrayer?.cancel();
    return super.close();
  }
}
