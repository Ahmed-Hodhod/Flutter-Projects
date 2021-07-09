import 'package:flutter/material.dart';
import 'package:bmi_calculator/Screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xFF0A0E21),
          // 0XFF : to have an obaque color
          accentColor: Colors.purple,
          //backgroundColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
          textTheme: TextTheme(
              body1: TextStyle(
            color: Colors.white,
          ))),
      home: InputPage(),
    );
  }
}



/**
 * Inspire designs from the great "dribble" webiste 
 * to create your own theme for the project ( such as a default color for each 
 * newly-created button), provide a them parameter to the constructor of 
 * MaterialApp. This helps to create your customized app with your own taste of 
 * colors for all screens of the app. i.e, it is a dynamic way of setting colors
 * and applying unifying the desgin. 
 * 
 * 
 * Tools : ColorZilla to pick the hex code of Colors from webistes 
 * Color(hexcode) : to use a hex code for Color class
 * 
 * if you want to use a prepared theme but with a little customiztion, 
 *  set  theme : ThemeData.dark().copyWith(
 *  primaryColor: .., so on),
 * 
 * U can also wrap any widget with Theme widget and customize it
 * 
 * Separate Compnents in different Dart files in order to have 
 * multiple screens. 
 * 
 * Before getting into the logic of our app, we first need to design the single 
 * components  (most often, cards are used) of each screen separately and then 
 * integrate them onto the screen. 
 * 
 * 
 *  Tip : Don't use HardCoded sizes, you can rather use Expanded widgets to get 
 * dynamic sizes.
 *  Card, Expanded, Container, ROW, COLUMN, are the most commonly used to 
 *  accomplish your designs 
 * 
 * INside Row or Column widget layouts, always use Expanded widget to 
 *  avoid hardcoded sizes. 
 * 
 *   Consider the structure of iNputPage very carefully. 
 * Inside Rows, use Expandeds, 
 * inside Expandeds, use Containers to get a customized decoration (through 
 * their decoration property ) &THEME 
 * 
 * 
 * iF YOU HAVE  a repetitive compnent ( namely, a widget), Extract it into a 
 *  separate widget and each time use an object from this widget class  \\
 * 
 * Use the Option ( Extract Widget ), to let the editor create this widget for you
 * 
 * 
 * Final vs Const 
 * 
 * 
 * use Icons from FontAwesome package 
 * 
 * 
 * It is always recommended to have only one widget in each dart file. Separation is 
 * preferred 
 * 
 * 
 * 
 * 
 * GestureDetector widget : to detect gesture at any other widget 
 * ( Crucially important )
 * 
 * 
 * 
 * 
 * ENUMS are used to have multiple options in your code to choose from . 
 * Syntax :  enum IDentifier { TypeA, TypeB, TypeC }
 * Access:    IDentifier.TypeA  
 * 
 * 
 * 
 * 
 * Ternary Operator : 
 *   condition ? doThisIfTrue : doThisIfFalse
 * 
 * 
 * in Dart, Methods are First-Class Citizens
 * (First-Order Objects ) : they can be passed as objects 
 * 
 * int add(int n1, int n2 ) => n1 + n2; 
 * int multiply(int n1, int n2) => n1 * n2; 
 * int Calc (int n1, int n2, Function calculation) => calculation(n1,n2); 
 *
 * Inside Class : 
 * Class Car {
 * Car(this.drive )
 * Function drive; 
 * }
 * 
 * 
 * from the firt moment, create a file dedicated only for constants to be shared 
 * accrosss app 
 * 
 * 
 * 
 * Flutter favours Composition over Inheritance 
 * in other words, if you want to build a widget, you can use the closest simple
 * widget to the widget you are seeking to build and compose it in the new widget. 
 * 
 * 
 * use at least one FloatingButtonAction widget per screen 
 * 
 * 
 * 
 * if you want to implement your own desing, look for a package or start building it 
 * from the given components 
 *  here in this project, we will build RoundedIconButton widget in the same 
 *   way Flutter used to build the floating button action 
 * 
 * 
 * 
 * 
 * Navigation : use this link from Flutter team to perform Navigation 
 * https://flutter.dev/docs/cookbook#navigation
 * the code used in the video : 
 * https://github.com/londonappbrewery/Navigation-Flutter-Demo\
 * Most importantly: 
 *  Navigate to a new screen and back
 *  Navigate with named routes
 * 
 * Map : 
 * Map<keyType, valueType> Name{
 * Key: Value, }
 * 
 * Access  : Name[Key]
 * 
 */
