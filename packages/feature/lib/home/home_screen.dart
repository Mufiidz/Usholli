import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'cubit/home_cubit.dart';
import 'section/coming_prayer_section.dart';
import 'section/headline_home_section.dart';
import 'section/prayer_schedule_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = getIt<HomeCubit>();
    _cubit.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocEffect<HomeCubit, HomeState, HomeEffect>(
          _cubit,
          sideEffect: (context, state) => switch (state) {
            ShowSnackbar(:final message) => context.showSnackbarError(message),
          },
          builder: (context, state) => switch (state.statusStateScreen) {
            StatusStateScreen.loading => const CircularProgressIndicator(),
            StatusStateScreen.failure => Text(
              state.message,
              style: const TextStyle(color: Colors.red),
            ),
            _ => RefreshIndicator(
              onRefresh: () async => _cubit.init(),
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                slivers: [
                  SliverAppBar(
                    title: Text(
                      'Usholli',
                      style: context.textTheme.headlineLarge?.copyWith(
                        color: context.colorScheme.primary,
                      ),
                    ),
                    pinned: true,
                  ),
                  HeadlineHomeSection(calendarToday: state.calendarToday),
                  ComingPrayerSection(_cubit, comingPrayerTime: state.nextPrayerTime),
                  PrayerScheduleSection(
                    prayerTime: state.prayerTime?.allPrayerTimes,
                    currentPrayer: state.nextPrayerTime,
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(height: AppSize.lg),
                  ),
                ],
              ),
            ),
          },
        ),
      ),
    );
  }
}
