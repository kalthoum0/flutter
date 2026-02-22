part of 'filter_button_bloc.dart';

@immutable
sealed class FilterButtonState {
  final int selectedIndex; // Move the property to the base class
  const FilterButtonState(this.selectedIndex);
}

final class FilterButtonInitial extends FilterButtonState {
  const FilterButtonInitial() : super(-1);
}

final class FilterButtonActive extends FilterButtonState {
  const FilterButtonActive({required int selectedIndex}) : super(selectedIndex);
}
