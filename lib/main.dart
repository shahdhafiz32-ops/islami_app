import 'package:flutter/material.dart';
import 'package:islami_application/tabs/hadeeth/hadeeth_details.dart';
import 'package:islami_application/tabs/onboarding/onboarding_screen.dart';
import 'package:islami_application/tabs/quran/quran_service.dart';
import 'package:islami_application/tabs/quran/sura_details_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_theme.dart';
import 'home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await QuranService.getMostRecently();

  final prefs = await SharedPreferences.getInstance();

  final bool onboardingCompleted =
      prefs.getBool('onboarding_completed') ?? false;

  runApp(
    IslamiApp(
      onboardingCompleted: onboardingCompleted,
    ),
  );
}

class IslamiApp extends StatelessWidget {
  final bool onboardingCompleted;

  const IslamiApp({
    super.key,
    required this.onboardingCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
        HadeethDetails.routeName: (_) => HadeethDetails(),
        OnboardingScreen.routeName: (_) => OnboardingScreen()
      },

      initialRoute: onboardingCompleted
          ? HomeScreen.routeName
          : OnboardingScreen.routeName,

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}