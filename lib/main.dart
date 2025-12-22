// import 'dart:ffi';
// import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:screentasia/screentasia.dart';
import 'package:flutter/foundation.dart'; 
import 'my_app.dart';

void main() {
  runApp(    
    ScreentasiaInit(builder: (context,child){      
     return DevicePreview(      
      enabled: !kReleaseMode,
      builder: (context) => MyApp(),               
    );        
    })    
  );
}





