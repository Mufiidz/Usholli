import 'package:flutter/material.dart';

import '../util/typedef.dart';

class ListWidget<T> extends StatelessWidget {
  final List<T> items;
  final IndexedWidgetBuilder? separatorBuilder;
  final OnItemBuilder<T> itemBuilder;
  final bool shrinkWrap;
  final ScrollPhysics? scrollPhysics;
  final ScrollController? controller;
  final EdgeInsetsGeometry? padding;
  final bool isHorizontal;
  final int? length;

  const ListWidget(
    this.items, {
    required this.itemBuilder,
    super.key,
    this.separatorBuilder,
    this.length,
    this.shrinkWrap = false,
    this.scrollPhysics = const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
    this.controller,
    this.padding = EdgeInsets.zero,
    this.isHorizontal = false,
  }) : assert(
         separatorBuilder == null,
         'Default mode does not support separatorBuilder. Use ListWidget.separated() instead.',
       );

  const ListWidget.separated(
    this.items, {
    required this.itemBuilder,
    required this.separatorBuilder,
    super.key,
    this.length,
    this.shrinkWrap = false,
    this.scrollPhysics = const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
    this.controller,
    this.padding = EdgeInsets.zero,
    this.isHorizontal = false,
  }) : assert(separatorBuilder != null, 'Separated mode requires a non-null separatorBuilder.');

  @override
  Widget build(BuildContext context) {
    final separatorBuilder = this.separatorBuilder;
    if (separatorBuilder != null) {
      return ListView.separated(
        scrollDirection: isHorizontal ? Axis.horizontal : Axis.vertical,
        itemCount: length ?? items.length,
        shrinkWrap: shrinkWrap,
        physics: scrollPhysics,
        padding: padding,
        controller: controller,
        itemBuilder: (context, index) => itemBuilder(context, items[index], index),
        separatorBuilder: separatorBuilder,
      );
    }

    return ListView.builder(
      scrollDirection: isHorizontal ? Axis.horizontal : Axis.vertical,
      itemCount: length ?? items.length,
      shrinkWrap: shrinkWrap,
      physics: scrollPhysics,
      padding: padding,
      controller: controller,
      itemBuilder: (context, index) => itemBuilder(context, items[index], index),
    );
  }
}
