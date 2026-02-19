import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'settings_sheet_event.dart';
part 'settings_sheet_state.dart';

class SettingsSheetBloc extends Bloc<SettingsSheetEvent, SettingsSheetState> {
  SettingsSheetBloc() : super(SettingsSheetInitial()) {
   
      // TODO: implement event handler
      on<OpenSettingsPressed>((event, emit) {
      // You could do logic here (fetch current settings, etc.)
      // Then emit the state that the UI is listening for:
      emit(ShowSettingsDialog());
      emit(SettingsSheetInitial());
    });
    
  }
}
