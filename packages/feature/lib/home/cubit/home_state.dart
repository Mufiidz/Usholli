part of 'home_cubit.dart';

@MappableClass(generateMethods: GenerateMethods.copy | GenerateMethods.equals | GenerateMethods.stringify)
class HomeState extends BaseState with HomeStateMappable {
  final String city;
  final PrayerSchedule? prayerTime;
  final PrayerTime? nextPrayerTime;
  final String? countdownPrayer;
  final CalendarToday? calendarToday;

  HomeState({
    super.message,
    super.statusState,
    super.statusStateScreen,
    this.city = '',
    this.prayerTime,
    this.nextPrayerTime,
    this.countdownPrayer,
    this.calendarToday,
  });
}

sealed class HomeEffect {
  factory HomeEffect.showSnackBar(String errorMessage) => ShowSnackbar(errorMessage);
}

class ShowSnackbar implements HomeEffect {
  final String message;

  ShowSnackbar(this.message);
}
