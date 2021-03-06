import 'package:clima/services/networking.dart';
import 'location.dart';
import 'package:clima/utilities/constants.dart';

class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }

  Future<dynamic> getCityWeather(String cityName) async {
    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&mode=json&appid=$apiKey');
    var data = await network.getData();
    return data;
  }

  Future<dynamic> getLocationWeather() async {
    Location loc = Location();
    await loc.getCurrentLocation();

    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=${loc.latitude}&lon=${loc.longitude}&appid=$apiKey&mode=json');
    return await network.getData();
  }
}
