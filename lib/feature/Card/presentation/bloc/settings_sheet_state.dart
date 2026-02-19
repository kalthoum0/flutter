part of 'settings_sheet_bloc.dart';

@immutable
sealed class SettingsSheetState {}

final class SettingsSheetInitial extends SettingsSheetState {}

final class ShowSettingsDialog extends SettingsSheetState {
  // final String cardId; 
  // ShowSettingsDialog({required this.cardId});
}
