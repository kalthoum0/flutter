// import 'dart:ffi';
// import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/feature/Home/presentation/bloc/theme_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screentasia/screentasia.dart';
import 'package:flutter/foundation.dart'; 
import 'my_app.dart';

void main() {
  runApp(    
    ScreentasiaInit(      
      builder: (context,child){      
      return DevicePreview(      
        enabled: !kReleaseMode, /**enable ONLY in debug/dev**/
        builder: (context) => BlocProvider(
          create:(context) => ThemeBloc(),
          child: MyApp()),               
      );        
    })    
  );
}





