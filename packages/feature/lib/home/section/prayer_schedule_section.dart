import 'package:core/core.dart';
import 'package:core/widgets/list_widget.dart';
import 'package:domain/model/prayer_time.dart';
import 'package:flutter/material.dart';

class PrayerScheduleSection extends StatelessWidget {
  final List<PrayerTime>? prayerTime;
  final PrayerTime? currentPrayer;
  const PrayerScheduleSection({super.key, this.prayerTime, this.currentPrayer});

  @override
  Widget build(BuildContext context) {
    final prayerTime = this.prayerTime;
    if (prayerTime == null || prayerTime.isEmpty) {
      return SliverToBoxAdapter(child: const SizedBox.shrink());
    }
    return SliverToBoxAdapter(
      child: Padding(
        padding: AppPadding.lg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSize.lg,
          children: [
            Text(
              'Today Schedule',
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.primary,
              ),
            ),
            ListWidget.separated(
              prayerTime,
              scrollPhysics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) => SizedBox(height: AppSize.lg),
              itemBuilder: (context, item, index) => Container(
                padding: AppPadding.lg,
                decoration: BoxDecoration(
                  color: item == currentPrayer
                      ? context.colorScheme.onPrimaryContainer
                      : context.colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(AppSize.lg),
                  border: Border.all(color: context.colorScheme.outlineVariant),
                ),
                child: Row(
                  spacing: AppSize.lg,
                  children: [
                    Icon(item.icon, color: item == currentPrayer ? Colors.white : context.colorScheme.primary),
                    Expanded(
                      child: Text(
                        item.title,
                        textAlign: TextAlign.start,
                        style: context.textTheme.titleLarge.orDefault().copyWith(
                          fontWeight: FontWeight.w700,
                          color: item == currentPrayer ? Colors.white : context.colorScheme.primary,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        item.time.shortTime,
                        textAlign: TextAlign.end,
                        style: context.typography.bodyPrimary.copyWith(
                          fontWeight: FontWeight.bold,
                          color: item == currentPrayer ? Colors.white : context.colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
