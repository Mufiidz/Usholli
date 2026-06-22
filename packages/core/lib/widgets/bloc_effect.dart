import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../base/base_cubit.dart';

typedef SideEffectWidgetListener<E> = void Function(BuildContext context, E effect);

class BlocEffect<C extends BaseCubit<S, E>, S, E> extends StatefulWidget {
  final C bloc;
  final BlocWidgetBuilder<S>? builder;
  final BlocWidgetListener<S>? listener;
  final SideEffectWidgetListener<E>? sideEffect;
  final BlocBuilderCondition<S>? buildWhen;
  final BlocListenerCondition<S>? listenWhen;
  final Widget? child;

  const BlocEffect(
    this.bloc, {
    super.key,
    this.builder,
    this.listener,
    this.sideEffect,
    this.buildWhen,
    this.listenWhen,
    this.child,
  }) : assert(builder != null || child != null, 'Either builder or child must be provided.');

  @override
  State<BlocEffect<C, S, E>> createState() => _EffectBlocConsumerState<C, S, E>();
}

class _EffectBlocConsumerState<C extends BaseCubit<S, E>, S, E> extends State<BlocEffect<C, S, E>> {
  StreamSubscription<E>? _effectSubscription;

  @override
  void initState() {
    super.initState();
    _subscribeEffect();
  }

  void _subscribeEffect() {
    final sideEffect = widget.sideEffect;
    if (sideEffect == null) return;

    final cubit = widget.bloc;
    _effectSubscription = cubit.sideEffect.listen((effect) {
      if (!mounted) return;

      sideEffect(context, effect);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget current = widget.child ?? const SizedBox.shrink();

    // 1. Jika builder diisi, bungkus dengan BlocBuilder
    if (widget.builder != null) {
      current = BlocBuilder<C, S>(bloc: widget.bloc, buildWhen: widget.buildWhen, builder: widget.builder!);
    }

    // 2. Jika listener diisi, bungkus lagi dengan BlocListener
    if (widget.listener != null) {
      current = BlocListener<C, S>(
        bloc: widget.bloc,
        listenWhen: widget.listenWhen,
        listener: widget.listener!,
        child: current,
      );
    }

    return current;
  }

  @override
  void dispose() {
    _effectSubscription?.cancel();
    super.dispose();
  }
}
