part of 'theme_bloc.dart';

@immutable
sealed class ThemeEvent {}

final class ThemeToggle extends ThemeEvent{
  final ThemeMode themeMode;
  

  ThemeToggle({
    required this.themeMode, 
  });
}