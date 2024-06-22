import 'package:easy_localization/easy_localization.dart';
import 'package:egy_travel/core/Di/dependency_injection.dart';
import 'package:egy_travel/core/helpers/bloc_observer.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/res/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:egy_travel/view/Screens/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  Gemini.init(apiKey: AppStrings.geminiApiKey);
  setupGetIt();
  Bloc.observer = MyBlocObserver();

  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'AE')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      saveLocale: true,
      startLocale: const Locale('en', 'US'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorsManager.primary,
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
