class WeatherHelper {
  String categorizeHumidity(num humidity) {
    if (humidity <= 25) {
      return "Uncomfortably dry";
    } else if (humidity > 25 && humidity <= 60) {
      return "Comfortable";
    } else if (humidity > 60 && humidity <= 100) {
      return "Uncomfortably humid";
    } else {
      return "Error";
    }
  }

  String categorizeVisibility(num visibilityPercentage) {
    if (visibilityPercentage <= 20) {
      return 'Very Weak';
    } else if (visibilityPercentage <= 40) {
      return 'Weak';
    } else if (visibilityPercentage <= 60) {
      return 'Normal';
    } else if (visibilityPercentage <= 80) {
      return 'Good';
    } else {
      return 'Very Good';
    }
  }

  String categorizeAirWithEpaIndex(num airQualityStatus) {
    if (airQualityStatus == 1) {
      return 'Good';
    } else if (airQualityStatus == 2) {
      return 'Moderate';
    } else if (airQualityStatus == 3) {
      return 'Unhealthy for sensitive group';
    } else if (airQualityStatus == 4) {
      return 'Unhealthy';
    } else if (airQualityStatus == 5) {
      return 'Very Unhealthy';
    } else if (airQualityStatus == 6) {
      return 'Hazardous';
    } else {
      return 'Error';
    }
  }
}
