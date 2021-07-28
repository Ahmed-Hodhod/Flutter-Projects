import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen(this.weatherData);
  final weatherData;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  double temprature;
  String cityName;
  int condition;
  WeatherModel weather = WeatherModel();

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temprature = 0;
        cityName = 'Unable to get the error';
        condition = -1;
        return;
      }
      // whenver you call call updateUI, call these values
      temprature = weatherData["main"]["temp"];
      cityName = weatherData["name"];
      condition = weatherData["weather"][0]["id"];
    });
  }

  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      updateUI(await WeatherModel().getLocationWeather());
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      // Navigating back with a data
                      // When popping out the 
                      var cityName = await Navigator.push(
                          context, // dont forget this await
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));

                      if (cityName != null) {
                        var weatherData =
                            await WeatherModel().getCityWeather(cityName);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${(temprature - 273).toInt()}°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '${weather.getWeatherIcon(condition)}',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '${weather.getMessage((temprature - 273.0).toInt())} in ${cityName}}',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/**
 *   Await is always used along with async keyword
 *  asyn is used for time consuming tasks such as grabbing the location of 
 *  the current user . 
 * 
 *    Package : GeoLocator to grab the current location of the surfing device. 
 *    U need to get the permission before you get the location. 
 * 
 * 
 *   Synchronoous vs Asynchronous Programming 
 * 
 * Synchoronous : means to run your statements one by one. You 
 *  simply sends a request and waits till you get a response . You wait 
 *   how much time it takes. 
 * 
 *    Asynchoronous : you simply initiate a task and only when this task is complete , 
 * you are notified to act on it. Till you get the notification, you have all this time 
 *  initiating other tasks. 
 *  
 *  
 *  Print ( 'First ' ); 
 *  Load( image from nasa);  // Huge amount of data is grabbed
 *  print ( 'Second' ); 
 * 
 * for the above example : In Synchorouns programming, you would have to wait till
 * the nasa image is loaded. 
 * However in Asyn, You will initiate the response and complete with printing 'Second' 
 * and once your image is loaded completely, you are done. 
 * 
 *  When you intiate an async task, you are actually running it in the background 
 * and gets notified once the response is ready. 
 * 
 * This is done in Dart by using Future class 
 * 
 * 
 * 
 * 
 * 
 */
