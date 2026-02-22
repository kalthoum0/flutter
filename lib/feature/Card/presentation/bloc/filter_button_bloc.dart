import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'filter_button_event.dart';
part 'filter_button_state.dart';

class FilterButtonBloc extends Bloc<FilterButtonEvent, FilterButtonState> {
  FilterButtonBloc() : super(FilterButtonInitial()) {
    on<ChangeColor>((event, emit) {
      // TODO: implement event handler
      // emit(FilterButtonInitial());
      emit(FilterButtonActive(selectedIndex: event.index));
    });
  }
}
