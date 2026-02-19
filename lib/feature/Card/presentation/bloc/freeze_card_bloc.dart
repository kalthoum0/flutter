import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/feature/Card/domain/entities/card_dialog_type.dart';
import 'package:meta/meta.dart';

part 'freeze_card_event.dart';
part 'freeze_card_state.dart';

class FreezeCardBlocBloc extends Bloc<FreezeCardBlocEvent, FreezeCardBlocState> {
  FreezeCardBlocBloc() : super(FreezeCardBlocInitial()) {
    on<OpenFreezeDialog>((event, emit) {
      // TODO: implement event handler
      emit(ShowCardDialog(dialogType: event.type));
      emit(FreezeCardBlocInitial());

    });
  }
}
