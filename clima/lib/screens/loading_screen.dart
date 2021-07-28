import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude = -1;
  double longitude = -1;

  void getLocationData() async {
    dynamic weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherData);
    }));
  }

  // Future<void> getData() async {
  //   if (response.statusCode < 400) {
  //     var data = jsonDecode(response.body); // Notice, Dynamic Return
  //     var temprature = data['main']['temp'];
  //     var condition = data['weather'][0]['description'];
  //     var cityName = data['name'];
  //     print(temprature);
  //     print(cityName);
  //   } else {
  //     print(response.statusCode);
  //   }
  // }

  @override
  // the code inside this funciton will be performed
  // the first time your widget is initilized on the screen (Only Once )
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitCircle(
        color: Colors.red,
        size: 100,
      ),
    );
  }
}

/**
 * Widget Life Cycle 
 *  There are common points in the life cycle of a widget, 
      such as   InitState,  BUild , deactive 
 * initstate  : when the widget is initiated at the first time (at hot restart)
 * Build : is called each time when the widget is built and has some changes ( at hot reload)
 * Deactive : is called when the widget is destroyed such as you have been directed
  to antoher screen. 
 */
