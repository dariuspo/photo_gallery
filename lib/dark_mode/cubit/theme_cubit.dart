import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_state.dart';
class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void changeTheme({required bool isDarkMode}){
    emit(isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }

  @override
  ThemeMode fromJson(Map<String, dynamic> json) {
    final index = (json['value'] as int?) ?? 0;
    return ThemeMode.values[index];
  }

  @override
  Map<String, int> toJson(ThemeMode state) {
    final int = state.index;
    return {'value': int};
  }
}
