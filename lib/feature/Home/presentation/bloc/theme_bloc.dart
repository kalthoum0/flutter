import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'theme_event.dart';



class ThemeBloc extends Bloc<ToggleTheme,ThemeMode>{
  ThemeBloc(): super(ThemeMode.light){
     on<ToggleTheme>((event,emit){
      emit(state == ThemeMode.light? ThemeMode.dark : ThemeMode.light);
    });
  }
}



