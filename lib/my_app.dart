import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/feature/Home/presentation/bloc/theme_bloc.dart';
import 'package:flutter_application_2/feature/Home/presentation/pages/smart_pay.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screentasia/screentasia.dart';
import 'feature/Home/bloc/theme_bloc.dart';
import 'feature/startUp/presentation/page/start_up.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
    // BlocBuilder<ThemeBloc, ThemeMode>(
    //   builder: (context, themeMode) =>
    BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            themeMode: state is ThemeLight ? ThemeMode.light : ThemeMode.dark,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.light(
                primary: Color(0xFF0a66a9),
                secondary: Color(0xFF6ab0f9),
                tertiary: Color(0xFFd1e4ff),
                error: Color(0xFFB00020),
                background: Colors.white,
                primaryContainer: Colors.grey.withOpacity(0.3),
                secondaryContainer: Color(0xFF3E8E41),
                tertiaryContainer: Color.fromARGB(255, 230, 241, 254),
                onSecondaryContainer: Color(0xFF5FAF65).withOpacity(0.3),
                secondaryFixed: const Color(0xFFDECED1),
                secondaryFixedDim: const Color(0xFFDCDCDC),
                surfaceDim: const Color(0xFFAED4FF),
                surfaceContainerHigh: Color(0xFFDEF2E4),
                onSurfaceVariant: Color(0xFF629A6B),
                surfaceContainerLow: Color(0xFFF1F1F1),
                shadow: const Color.fromARGB(
                  255,
                  113,
                  113,
                  113,
                ).withOpacity(0.3),
                outline: const Color.fromARGB(
                  255,
                  205,
                  205,
                  205,
                ).withOpacity(0.3),
              ),
              // splashColor:Color(0xFF0a66a9) ,
              textTheme: GoogleFonts.cairoTextTheme().copyWith(
                titleLarge: TextStyle(
                  fontFamily: GoogleFonts.cairo().fontFamily,
                  fontSize: 15.sp.ap(
                    adaptivePercentage: const AdaptivePercentage(
                      tablet: 80,
                      desktop: 60,
                    ),
                  ),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                titleMedium: TextStyle(
                  fontFamily: GoogleFonts.cairo().fontFamily,
                  fontSize: 15.sp.ap(
                    adaptivePercentage: const AdaptivePercentage(
                      tablet: 80,
                      desktop: 60,
                    ),
                  ),
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
                  color: Colors.black,
                  fontSize: 14.sp.ap(
                    adaptivePercentage: const AdaptivePercentage(
                      tablet: 80,
                      desktop: 60,
                    ),
                  ),
                ),
                bodyMedium: TextStyle(
                  fontFamily: GoogleFonts.cairo().fontFamily,
                  color: Colors.black,
                  fontSize: 12.sp.ap(
                    adaptivePercentage: const AdaptivePercentage(
                      tablet: 80,
                      desktop: 60,
                    ),
                  ),
                ),
                bodySmall: TextStyle(
                  fontFamily: GoogleFonts.cairo().fontFamily,
                  color: Colors.black,
                  fontSize: 12.sp.ap(
                    adaptivePercentage: const AdaptivePercentage(
                      tablet: 80,
                      desktop: 60,
                    ),
                  ),
                ),
                labelLarge: TextStyle(
                  fontFamily: GoogleFonts.cairo().fontFamily,
                  fontSize: 14.sp.ap(
                    adaptivePercentage: const AdaptivePercentage(
                      tablet: 80,
                      desktop: 60,
                    ),
                  ),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                labelMedium: TextStyle(
                  fontFamily: GoogleFonts.cairo().fontFamily,
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              // Define the Dark ColorScheme
              colorScheme: ColorScheme.dark(
                primary: const Color(
                  0xFF6ab0f9,
                ), // Lighter blue for better contrast on dark
                secondary: const Color(0xFF0a66a9),
                tertiary: const Color.fromARGB(255, 41, 64, 112),
                error: const Color(0xFFCF6679),
                background: const Color(
                  0xFF121212,
                ).withOpacity(0.3), // Standard Material dark background
                surface: const Color(0xFF1E1E1E), // Card/Container background
                primaryContainer: Colors.white.withOpacity(0.1),
                secondaryContainer: const Color(0xFF2D5A2E),
                tertiaryContainer: const Color(0xFF1a2b4d),
                surfaceContainerLow: const Color(
                  0xFF212121,
                ), // Replaces your F1F1F1
                shadow: Colors.black.withOpacity(0.5),
                outline: Colors.white.withOpacity(0.12),
              ),
              textTheme: GoogleFonts.cairoTextTheme(ThemeData.dark().textTheme)
                  .copyWith(
                    titleLarge: TextStyle(
                      fontFamily: GoogleFonts.cairo().fontFamily,
                      fontSize: 15.sp.ap(
                        adaptivePercentage: const AdaptivePercentage(
                          tablet: 80,
                          desktop: 60,
                        ),
                      ),
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    titleMedium: TextStyle(
                      fontFamily: GoogleFonts.cairo().fontFamily,
                      fontSize: 15.sp.ap(
                        adaptivePercentage: const AdaptivePercentage(
                          tablet: 80,
                          desktop: 60,
                        ),
                      ),
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    bodyLarge: TextStyle(
                      fontFamily: GoogleFonts.cairo().fontFamily,
                      color: Colors.white70,
                      fontSize: 14.sp.ap(
                        adaptivePercentage: const AdaptivePercentage(
                          tablet: 80,
                          desktop: 60,
                        ),
                      ),
                    ),
                  ),
            ),
            home: const StartUp(),
          );
        },
      ),
    );
  }
}
