import 'package:egytraveler/core/utils/wether_lottie.dart';

String getWeatherIcon(String weather) {
  // Trim the weather string to remove any leading or trailing whitespaces
  final trimmedWeather = weather.trim().toLowerCase();

  String defaultIcon = (DateTime.now().hour >= 5 && DateTime.now().hour < 19)
      ? 'assets/lottie/Sunny.json'
      : 'assets/lottie/ClearSky.json';

  // Use a default icon if the weather description is not in the map
  return weatherIcons[trimmedWeather] ?? defaultIcon;
}
