// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeLight()) {
    on<ThemeToggle>((event, emit) {
      event.themeMode == ThemeMode.light? emit(ThemeLight()): emit(ThemeDark());
    });
  }
}
