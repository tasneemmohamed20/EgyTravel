import 'package:easy_localization/easy_localization.dart';
import 'package:egy_travel/core/Di/dependency_injection.dart';
import 'package:egy_travel/core/helpers/bloc_observer.dart';
import 'package:egy_travel/core/helpers/constants.dart';
import 'package:egy_travel/core/helpers/extensions.dart';
import 'package:egy_travel/core/helpers/shared_pref_helper.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/res/string_manager.dart';
import 'package:egy_travel/src/controllers/location_controller.dart';
import 'package:egy_travel/src/services/location_service.dart';
import 'package:egy_travel/view/Screens/login_screen.dart';
import 'package:egy_travel/view/Screens/primary_screen.dart';
import 'package:egy_travel/view_model/RadioButtons/radio_cubit.dart';
import 'package:egy_travel/view_model/profileCubit/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:egy_travel/view/Screens/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  Gemini.init(apiKey: AppStrings.geminiApiKey);
  setupGetIt();
  Bloc.observer = MyBlocObserver();
  await checkIFLoggedIn();
  await getUserLocation();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'AE')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      saveLocale: true,
      startLocale: const Locale('en', 'US'),
      child: const MyApp()));
}

checkIFLoggedIn() async {
  String? userToken =
      await SharedPrefHelper.getString(SharedPrefKeys.userToken);
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}

getUserLocation() async {
  final LocationController locationController =
      Get.put<LocationController>(LocationController());
  LocationService.instance.getLocation(controller: locationController);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RadioButtonCubit(),
      child: BlocBuilder<RadioButtonCubit, RadioButtonState>(
        builder: (context, state) {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: ColorsManager.primary,
              useMaterial3: true,
            ),
            routes: {
              '/login': (context) => const LogInScreen(),
              '/primary': (context) => const PrimaryScreen(),
            },
            home: BlocProvider(
              create: (context) => getIt<ProfileCubit>()..getProfile(),
              child: const SplashScreen(),
            ),
          );
        },
      ),
    );
  }
}
