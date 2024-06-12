import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void navigateFish(BuildContext context, Widget widget) {
  Navigator.pushAndRemoveUntil(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    ),
    (route) => false,
  );
}

//--------------------------------------------
class LocalizationChecker {
  static changeLanguage(BuildContext context) {
    Locale? currentLocale = EasyLocalization.of(context)!.currentLocale;
    currentLocale!.languageCode == 'en'
        ? const Locale('ar', 'AE')
        : const Locale('en', 'US');
    EasyLocalization.of(context)!.setLocale(currentLocale);
  }
}
// class LocalizationChecker {
//   static changeLanguage(BuildContext context, Locale newLocale) {
//     EasyLocalization.of(context)!.setLocale(newLocale);
//   }
// }
