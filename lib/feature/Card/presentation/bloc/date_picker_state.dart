part of 'date_picker_bloc.dart';

@immutable
sealed class DatePickerState {
  // final DateTime? selectedDate;
  // const DatePickerState(this.selectedDate);

  final DateTimeRange? range;
  const DatePickerState(this.range);
}

final class DatePickerInitial extends DatePickerState {
  const DatePickerInitial() : super(null);
}

final class DatePickerSelected extends DatePickerState {
  const DatePickerSelected(DateTimeRange selectedRange) : super(selectedRange);
}
