part of 'freeze_card_bloc.dart';

// enum CardDialogType { 
//   freeze, 
//   setPin, 
//   resetPin, 
//   cardNumber,
//   statement }

@immutable
sealed class FreezeCardBlocState {}

final class FreezeCardBlocInitial extends FreezeCardBlocState {}

final class ShowCardDialog extends FreezeCardBlocState{
  final CardDialogType dialogType;
  ShowCardDialog({required this.dialogType});
}


final class ConfirmFreeze extends FreezeCardBlocState{}

