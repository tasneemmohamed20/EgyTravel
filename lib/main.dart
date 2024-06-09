import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/res/string_manager.dart';
import 'package:egy_travel/view_model/FilterBarCubit/filter_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:egy_travel/view/Screens/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  // final prefs = await SharedPreferences.getInstance();
  // final onboarding = prefs.getBool("onBoarding") ?? false;
  Gemini.init(apiKey: AppStrings.geminiApiKey);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FilterBarCubit()),
      ],
      child: MaterialApp(
        // localizationsDelegates: [
        //   S.delegate,
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],
        // supportedLocales: S.delegate.supportedLocales,
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
