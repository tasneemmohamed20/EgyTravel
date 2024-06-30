String getDateStatus(String dateString) {
  DateTime parsedDate = DateTime.parse(dateString);
  DateTime now = DateTime.now();

  // Truncate both dates to midnight to compare just the dates without time
  DateTime truncatedParsedDate =
      DateTime(parsedDate.year, parsedDate.month, parsedDate.day);
  DateTime truncatedNow = DateTime(now.year, now.month, now.day);

  // Calculate the difference in days between the target date and today
  int differenceInDays = truncatedParsedDate.difference(truncatedNow).inDays;

  if (differenceInDays == 0) {
    return "Today";
  } else if (differenceInDays == 1) {
    return "Tmrw";
  } else {
    // Calculate the index of the day of the week (0 for Monday, 1 for Tuesday, etc.)
    int dayOfWeekIndex =
        (parsedDate.weekday + 6) % 7; // Adjust for zero-based indexing

    // Define a list of day names
    List<String> dayNames = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    // Return the corresponding day name
    return dayNames[dayOfWeekIndex];
  }
}

Map<String, Map<String, dynamic>> getNext7HoursWithValues(
    List<String> dateHoursList,
    List<int> valuesList,
    List<String> conditionList) {
  // Get the current hour
  DateTime now = DateTime.now();
  int currentHour = now.hour;

  // Find the index of the current hour in the list
  int currentIndex = dateHoursList.indexWhere((hour) {
    return int.parse(hour.split(' ')[1].split(':')[0]) == currentHour;
  });

  // If the current hour is found in the list
  if (currentIndex != -1) {
    // Initialize the result map
    Map<String, Map<String, dynamic>> next7HoursWithValues = {
      dateHoursList[currentIndex].split(' ')[1]: {
        'value': valuesList[currentIndex],
        'condition': conditionList[currentIndex]
      }
    };

    // Add the next 6 hours with their corresponding values to the result map
    for (int i = 1; i < 7; i++) {
      int nextIndex = (currentIndex + i) % dateHoursList.length;
      next7HoursWithValues[dateHoursList[nextIndex].split(' ')[1]] = {
        'value': valuesList[nextIndex],
        'condition': conditionList[nextIndex]
      };
    }

    return next7HoursWithValues;
  } else {
    // If the current hour is not found in the list, return an empty map
    return {};
  }
}
