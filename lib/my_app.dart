import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screentasia/screentasia.dart';
import 'feature/startUp/presentation/page/start_up.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {  
    return MaterialApp(           
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(        
        colorScheme: ColorScheme.light(          
          primary:Color(0xFF0a66a9),
          secondary: Color(0xFF6ab0f9),
          tertiary:  Color(0xFFd1e4ff),
          error: Color(0xFFB00020),
          background: Colors.white,
          primaryContainer: Colors.grey.withOpacity(0.3),
          secondaryContainer: Color(0xFF3E8E41),
          onSecondaryContainer:Color(0xFF5FAF65).withOpacity(0.3),
          secondaryFixed:const Color(0xFFDECED1),
          secondaryFixedDim: const Color(0xFFDCDCDC), 
          surfaceDim: const Color(0xFFAED4FF),
        ),
        // splashColor:Color(0xFF0a66a9) ,
        textTheme: GoogleFonts.cairoTextTheme().copyWith(
            titleLarge: TextStyle(
              fontFamily: GoogleFonts.cairo().fontFamily,
              fontSize: 15.sp.ap(
                  adaptivePercentage:
                      const AdaptivePercentage(tablet: 80, desktop: 60)),
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            titleMedium: TextStyle(
              fontFamily: GoogleFonts.cairo().fontFamily,
              fontSize: 15.sp.ap(
                  adaptivePercentage:
                      const AdaptivePercentage(tablet: 80, desktop: 60)),
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            titleSmall: TextStyle(
              fontFamily: GoogleFonts.cairo().fontFamily,
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            bodyLarge: TextStyle(
              fontFamily: GoogleFonts.cairo().fontFamily,
              color:Colors.black,
              fontSize: 14.sp.ap(
                  adaptivePercentage:
                      const AdaptivePercentage(tablet: 80, desktop: 60)),
            ),
            bodyMedium: TextStyle(
              fontFamily: GoogleFonts.cairo().fontFamily,
              color:Colors.black,
              fontSize: 12.sp.ap(
                  adaptivePercentage:
                      const AdaptivePercentage(tablet: 80, desktop: 60)),
            ),
            bodySmall: TextStyle(
              fontFamily: GoogleFonts.cairo().fontFamily,
              color:Colors.black,
              fontSize: 12.sp.ap(
                  adaptivePercentage:
                      const AdaptivePercentage(tablet: 80, desktop: 60)),
            ),
            labelLarge: TextStyle(
              fontFamily: GoogleFonts.cairo().fontFamily,
              fontSize: 14.sp.ap(
                  adaptivePercentage:
                      const AdaptivePercentage(tablet: 80, desktop: 60)),
              color:Colors.black,
              fontWeight: FontWeight.bold,
            ),
            labelMedium: TextStyle(
              fontFamily: GoogleFonts.cairo().fontFamily,
              fontSize: 16,
              color:Colors.black,
              fontWeight: FontWeight.bold,
            ),
          )
      ),
      home: const StartUp(),
    );
  }
}