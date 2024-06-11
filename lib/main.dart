import 'package:easy_localization/easy_localization.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/res/string_manager.dart';
import 'package:egy_travel/view_model/FilterBarCubit/filter_bar_cubit.dart';
import 'package:egy_travel/view_model/RadioButtons/radio_cubit.dart';
import 'package:flutter/material.dart';
import 'package:egy_travel/view/Screens/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  Gemini.init(apiKey: AppStrings.geminiApiKey);

  runApp(EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'AE')],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FilterBarCubit()),
        BlocProvider(create: (context) => RadioButtonCubit()),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: ColorsManager.primary,
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
