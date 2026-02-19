part of 'settings_sheet_bloc.dart';

@immutable
sealed class SettingsSheetEvent {}

final class OpenSettingsPressed extends SettingsSheetEvent {
  // final String cardId;
  // OpenSettingsPressed(this.cardId);
}