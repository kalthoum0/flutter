part of 'freeze_card_bloc.dart';

@immutable
sealed class FreezeCardBlocEvent {}


final class OpenFreezeDialog extends FreezeCardBlocEvent{
  final CardDialogType type;
  
  OpenFreezeDialog({required this.type});
}