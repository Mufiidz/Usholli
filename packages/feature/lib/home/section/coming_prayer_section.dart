import 'package:core/core.dart';
import 'package:domain/model/prayer_time.dart';
import 'package:flutter/material.dart';

import '../cubit/home_cubit.dart';

class ComingPrayerSection extends StatelessWidget {
  final HomeCubit _cubit;
  final PrayerTime? comingPrayerTime;
  const ComingPrayerSection(this._cubit, {super.key, this.comingPrayerTime});

  @override
  Widget build(BuildContext context) {
    final comingPrayerTime = this.comingPrayerTime;
    if (comingPrayerTime == null) {
      return SliverToBoxAdapter(child: const SizedBox.shrink());
    }
    return SliverToBoxAdapter(
      child: Padding(
        padding: AppPadding.md,
        child: Card(
          elevation: 6,
          color: context.colorScheme.onPrimaryContainer,
          shadowColor: context.colorScheme.onPrimaryContainer,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.xxl)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.xl, vertical: AppSize.xxl),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: AppSize.xs,
                    children: [
                      Text(
                        'Next Prayer'.toUpperCase(),
                        style: context.typography.cardTitle.copyWith(color: Colors.grey),
                      ),
                      Text(
                        comingPrayerTime.title,
                        style: context.textTheme.headlineLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'at ${comingPrayerTime.time.shortTime}',
                        style: context.textTheme.titleMedium?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: BlocSelector<HomeCubit, HomeState, String?>(
                    bloc: _cubit,
                    selector: (state) => state.countdownPrayer,
                    builder: (context, state) {
                      final remainingTime = state;
                      if (remainingTime.isNullOrEmpty()) {
                        return const SizedBox.shrink();
                      }
                      return Container(
                        padding: AppPadding.md,
                        decoration: BoxDecoration(
                          color: context.colorScheme.surface.withValues(alpha: 0.3),
                          border: Border.all(color: Colors.white, width: 0.3),
                          borderRadius: BorderRadius.circular(AppSize.lg),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          spacing: AppSize.sm,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Starts in'.toUpperCase(),
                              style: context.typography.caption.copyWith(color: Colors.white),
                            ),
                            Text(
                              remainingTime.orDash(),
                              style: context.textTheme.titleLarge?.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
