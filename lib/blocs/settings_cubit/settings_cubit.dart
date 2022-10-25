import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsState());

  void changeSize(double size) {
    emit(state.copyWith(size: size));
  }

  void changevisualizedCount(int visualizedCount) {
    emit(state.copyWith(visualizedCount: visualizedCount));
  }

  void changeColor(Color color) {
    emit(state.copyWith(color: color));
  }
}
