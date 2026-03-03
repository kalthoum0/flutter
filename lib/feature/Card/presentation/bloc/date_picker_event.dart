part of 'date_picker_bloc.dart';

@immutable
sealed class DatePickerEvent {}

class SelectRange extends DatePickerEvent {
  final DateTimeRange dateRange;
  SelectRange(this.dateRange);
}
