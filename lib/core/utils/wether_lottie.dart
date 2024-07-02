Map<String, String> weatherIcons = {
  'cloudy': 'assets/lottie/PartlyCloudy.json',
  'raining': 'assets/lottie/RainyNight.json',
  'shower': 'assets/lottie/PartlyCloudy.json',
  'sunny': 'assets/lottie/Sunny.json',
  'clear sky': (DateTime.now().hour >= 5 && DateTime.now().hour < 18)
      ? 'assets/lottie/Sunny.json'
      : 'assets/lottie/ClearSky.json',
  // Change the value for 'clear' dynamically based on time
  'clear': (DateTime.now().hour >= 5 && DateTime.now().hour < 18)
      ? 'assets/lottie/Sunny.json'
      : 'assets/lottie/ClearSky.json',
  'overcast': 'assets/lottie/PartlyCloudy.json',
  'thunderstorm': 'assets/lottie/Thunder.json',
  'snow': 'assets/lottie/Snowy.json',
  'few clouds': 'assets/lottie/PartlyCloudy.json',
  'mist': 'assets/lottie/Mist.json',
  'haze': 'assets/lottie/Mist.json',
  'scattered clouds': 'assets/lottie/PartlyCloudy.json',
  'thunderstorm with rain': 'assets/lottie/Storm.json',
  'broken clouds': 'assets/lottie/PartlyCloudy.json',
  'overcast clouds': 'assets/lottie/Windy.json',
  'light rain': 'assets/lottie/RainyNight.json',
  'smoke': 'assets/lottie/Mist.json',
  'moderate rain': 'assets/lottie/DayRain.json',
  'partly cloudy': 'assets/lottie/PartlyCloudy.json',
  'patchy rain nearby': 'assets/lottie/RainyNight.json',
  'light snow': 'assets/lottie/Snow.json',
};
