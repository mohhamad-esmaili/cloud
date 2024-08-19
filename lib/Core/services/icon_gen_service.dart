import 'package:cloud/gen/assets.gen.dart';

// this function convert api response condition text to icon
// icons from api is not beautiful and with this func we convert better icons
// the icons are make with svg and are in assets
String changeIconGeneratorService(
    {required String apiCondition, num? isNight}) {
  $AssetsIconsGen iconAsset = Assets.icons;

  switch (apiCondition.trim().toLowerCase()) {
    case "clear":
      if (isNight == 0) {
        return iconAsset.wiNightClear;
      } else {
        return iconAsset.wiDaySunny;
      }
    case "sunny":
      if (isNight == 0) {
        return iconAsset.wiNightClear;
      } else {
        return iconAsset.wiDaySunny;
      }

    case "partly sunny":
      if (isNight == 0) {
        return iconAsset.wiNightCloudyHigh;
      }
      return iconAsset.wiDayCloudyHigh;

    case "mostly sunny":
      if (isNight == 0) {
        return iconAsset.wiNightAltCloudy;
      }
      return iconAsset.wiDaySunnyOvercast;

    case "overcast":
      if (isNight == 0) {
        return iconAsset.wiNightCloudy;
      }
      return iconAsset.wiDaySunnyOvercast;

    case "scattered thunderstorms" ||
          "thunderstorm" ||
          "chance of tstorm" ||
          "thundery outbreaks possible" ||
          "patchy light rain with thunder" ||
          "moderate or heavy rain with thunder":
      if (isNight == 0) {
        return iconAsset.wiNightThunderstorm;
      }
      return iconAsset.wiDayThunderstorm;

    case "showers":
      if (isNight == 0) {
        return iconAsset.wiNightShowers;
      }
      return iconAsset.wiDayShowers;

    case "scattered showers" ||
          "light rain shower" ||
          "moderate or heavy rain shower" ||
          "torrential rain shower":
      if (isNight == 0) {
        return iconAsset.wiNightShowers;
      }
      return iconAsset.wiDayShowers;

    case "rain and snow":
      if (isNight == 0) {
        return iconAsset.wiNightAltRainMix;
      }
      return iconAsset.wiDayRainMix;

    case "patchy light snow with thunder" ||
          "moderate or heavy snow with thunder":
      if (isNight == 0) {
        return iconAsset.wiNightSnowThunderstorm;
      }
      return iconAsset.wiDaySnowThunderstorm;

    case "light snow" ||
          "freezing drizzle" ||
          "patchy freezing drizzle possible" ||
          "blowing snow" ||
          "patchy light drizzle" ||
          "light drizzle" ||
          "heavy freezing drizzle" ||
          "patchy light snow" ||
          "patchy moderate snow" ||
          "light snow showers" ||
          "moderate or heavy snow showers":
      if (isNight == 0) {
        return iconAsset.wiNightAltSnow;
      }
      return iconAsset.wiDaySnow;

    case "chance of rain" || "patchy rain possible" || "patchy rain nearby":
      if (isNight == 0) {
        return iconAsset.wiNightSprinkle;
      }
      return iconAsset.wiDaySprinkle;

    case "partly cloudy":
      if (isNight == 0) {
        return iconAsset.wiNightCloudyHigh;
      }
      return iconAsset.wiDayCloudyHigh;

    case "mostly cloudy":
      if (isNight == 0) {
        return iconAsset.wiNightCloudyHigh;
      }
      return iconAsset.wiDayCloudyHigh;

    case "chance of storm" || "storm" || "blizzard":
      if (isNight == 0) {
        return iconAsset.wiNightSleetStorm;
      }
      return iconAsset.wiDaySleetStorm;

    case "rain" ||
          "flurries" ||
          "light rain" ||
          "patchy light rain" ||
          "moderate rain at times" ||
          "moderate rain" ||
          "light freezing rain":
      if (isNight == 0) {
        return iconAsset.wiNightRain;
      }
      return iconAsset.wiDayRain;

    case "heavy rain at times" ||
          "heavy rain" ||
          "moderate or heavy freezing rain":
      return iconAsset.wiRain;

    case "chance of snow" ||
          "snow" ||
          "snow showers" ||
          "patchy snow possible" ||
          "moderate snow" ||
          "patchy heavy snow" ||
          "heavy snow":
      if (isNight == 0) {
        return iconAsset.wiNightSnow;
      }
      return iconAsset.wiDaySnow;

    case "cloudy":
      return iconAsset.wiCloudy;

    case "mist":
      if (isNight == 0) {
        return iconAsset.wiNightFog;
      }
      return iconAsset.wiDayFog;

    case "sleet" ||
          "patchy sleet possible" ||
          "light sleet" ||
          "moderate or heavy sleet" ||
          "light sleet showers" ||
          "moderate or heavy sleet showers":
      if (isNight == 0) {
        return iconAsset.wiNightSleet;
      }
      return iconAsset.wiDaySleet;

    case "icy" ||
          "ice pellets" ||
          "light showers of ice pellets" ||
          "moderate or heavy showers of ice pellets":
      return iconAsset.wiSnow;

    case "dust":
      return iconAsset.wiDust;

    case "fog" || "haze" || "freezing fog":
      return iconAsset.wiFog;

    case "smoke":
      return iconAsset.wiSmoke;

    case "hail":
      return iconAsset.wiHail;

    default:
      return iconAsset.wiNa;
  }
}
