import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Test 1
    // return Provider<String>(
    //   create: (_) => 'Some data',
    //   child: Material(home: Scaffold(body: Level(),)),
    // );
    return ChangeNotifierProvider<Data>(
      create: (_) => Data(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('data')),
          backgroundColor: Colors.lightGreen,
          body: Level(),
        ),
      ),
    );
  }
}

class Level extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Column(
        children: [MyFieldText(), Level2()],
      ),
    );
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      /// Test 1 .
      //  child : Text(Provider.of<String>(context)),

      // You can prevent this widget from listening to updates, by settig listen to false
      child: Text(Provider.of<Data>(context, listen: true).data),
    );
  }
}

class MyFieldText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        onChanged: (value) {
          Provider.of<Data>(context, listen: false).changeData(value);
        },
      ),
    );
  }
}

class Data extends ChangeNotifier {
  String data = 'Print This';

  void changeData(String myString) {
    data = myString;
    notifyListeners();
  }
}


// If Provider.of is used inside an event handler such as onPressed, 
//you must pass listen: false to the of(context, liste: false)


