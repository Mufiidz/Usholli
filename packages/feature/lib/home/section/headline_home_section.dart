import 'package:core/core.dart';
import 'package:domain/model/calendar_today.dart';
import 'package:flutter/material.dart';

class HeadlineHomeSection extends StatelessWidget {
  final CalendarToday? calendarToday;
  const HeadlineHomeSection({super.key, this.calendarToday});

  @override
  Widget build(BuildContext context) {
    final today = calendarToday;
    if (today == null) {
      return SliverToBoxAdapter(
        child: const SizedBox.shrink(),
      );
    }
    return SliverToBoxAdapter(
      child: Padding(
        padding: AppPadding.lg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSize.lg,
          children: [
            Text(
              '${today.masehi.dayName}, ${today.masehi.day} ${today.masehi.monthName} ${today.masehi.year} ${today.masehi.calendarType?.suffix.orEmpty()}',
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.primary,
              ),
            ),
            Text(
              '${today.hijriah.day} ${today.hijriah.monthName} ${today.hijriah.year} ${today.hijriah.calendarType?.suffix.orEmpty()}',
              style: context.textTheme.titleLarge?.copyWith(
                color: context.colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
