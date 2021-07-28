import 'package:flutter/material.dart';
import 'package:clima/screens/loading_screen.dart';

/// By Ahmed Hodhod @ 2021   (Training on Flutter)

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}


/**
 * When U use a "await" before a statement, you are enforcing this task not to 
 * be peformed till the beforehand tasks are complete ( either to be Async or Sync)
 * Future : it is like a promise given by the asynchrounous task that it is gonna 
 * reurn this "vlue" . Check Scratch file on Resources (Git)
 * Try{} catch (exception ){print(exception)}     the same as Cpp
 * try catch throw 
 *
 * 
 *  ** Null Aware Operator ** 
 * EdgeInsets.all(myMargin ?? 30.0)    this means if myMargin has a value, use it 
 * otherwise, use 30 as the value 

 * ***** Application Programming Interface API ********
 * API that we are gonna use is Openweathermap.org 
 * 
 * cookbook api : fetch data from internet 
 * 
 * the data returned from an API usually is either in the format of XML or JSON. 
 * ex:with Weather APi, you can get the data in the two formats by deteriming the mode. 
 * JSON: https://api.openweathermap.org/data/2.5/onecall?lat=33.44&lon=-94.04&exclude=hourly,daily&mode=json&appid=46062de95f9e1f2434d18b06e245d225
 * xml : https://api.openweathermap.org/data/2.5/onecall?lat=33.44&lon=-94.04&exclude=hourly,daily&mode=xml&appid=46062de95f9e1f2434d18b06e245d225
 * 
 * XML  : <key> Value </key> 
 * 
 * JSON : javascript object notation {key : value}
 * 
 * use JSON Viewer awesome extension to ease reading Json files 
 * 
 * to process that data returned (response.body): 
 * 1. import 'dart/convert' 
 * 2. use the function jsonDecode(body)[key]  to get the value of a certain key
 * 
 * 
 * We will use flutter-spinkit package to implement the loading spinner. 
 
 */



// TODO : https://dart.dev/codelabs/async-await#why-asynchronous-code-matters

