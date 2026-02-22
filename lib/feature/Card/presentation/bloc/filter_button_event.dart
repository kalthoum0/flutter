part of 'filter_button_bloc.dart';

@immutable
sealed class FilterButtonEvent {}

final class ChangeColor extends FilterButtonEvent{
   final int index;

  ChangeColor(this.index);
}