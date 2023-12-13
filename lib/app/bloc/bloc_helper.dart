import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class GenericState extends Equatable {

  const GenericState({
    this.blocState = BlocState.initial,
    this.message = '',
  });
  final BlocState blocState;
  final String message;

  @override
  List<Object?> get props => [blocState, message];

  GenericState copyWith({
    BlocState? blocState,
    String? message,
  }) {
    return GenericState(
      message: message ?? this.message,
      blocState: blocState ?? this.blocState,
    );
  }
}

enum BlocState { initial, loading, success, failure }

extension BlocStateX on BlocState {
  bool get isInitial => this == BlocState.initial;
  bool get isLoading => this == BlocState.loading;
  bool get isSuccess => this == BlocState.success;
  bool get isFailure => this == BlocState.failure;
}

Future<void> blocListenerWrapper({
  required BlocState blocState, void Function()? onInitial,
  void Function()? onLoading,
  void Function()? onFinished,
  void Function()? onFailed,
}) async {
  switch (blocState) {
    case BlocState.initial:
      if (onInitial != null) onInitial();
    case BlocState.loading:
      if (onLoading != null) onLoading();
    case BlocState.success:
      if (onFinished != null) onFinished();
    case BlocState.failure:
      if (onFailed != null) onFailed();
  }
}

Widget blocBuilderWrapper({
  required BlocState blocState, Widget? initialBuilder,
  Widget? loadingBuilder,
  Widget? finishedBuilder,
  Widget? failedBuilder,
}) {
  switch (blocState) {
    case BlocState.initial:
      return initialBuilder ?? const SizedBox.shrink();
    case BlocState.loading:
      return loadingBuilder ?? const SizedBox.shrink();
    case BlocState.success:
      return finishedBuilder ?? const SizedBox.shrink();
    case BlocState.failure:
      return failedBuilder ?? finishedBuilder ?? const SizedBox.shrink();
  }
}
