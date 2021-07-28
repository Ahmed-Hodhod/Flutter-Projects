import 'package:flutter/material.dart';

/// A very simple app trying to mimic a very simple mobile design
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.teal,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/ana.jpg'),
                ),
                Text(
                  'Ahmed Hodhod',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico',
                  ),
                ),
                Text(
                  'Flutter Developer',
                  style: TextStyle(
                    color: Colors.teal.shade100,
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 150,
                  child: Divider(
                    color: Colors.teal.shade100,
                  ),
                ),
                GestureDetector(
                  child: Card(
                      color: Colors.white,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: Colors.teal,
                            ),
                            SizedBox(width: 10),
                            Text(
                              '+20 1151 5837 82',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Source Sans Pro',
                                color: Colors.teal.shade900,
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                Card(
                  // Container can used here as well
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ListTile(
                      leading: Icon(
                        Icons.email,
                        color: Colors.teal,
                      ),
                      title: Text(
                        'alhdhody@gmail.com',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Source Sans Pro',
                          color: Colors.teal.shade900,
                        ),
                      )),
                ),
              ],
            ),
          )),
    );
  }
}
