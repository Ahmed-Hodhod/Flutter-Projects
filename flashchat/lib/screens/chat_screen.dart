import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;
User loggedinUser;

class ChatScreen extends StatefulWidget {
  static const id = 'chat';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final __auth = FirebaseAuth.instance;

  // Dealing with FireStore

  String textMessage;

  void getCurrentUser() async {
    try {
      final user = __auth.currentUser;
      if (user != null) {
        loggedinUser = user;
        print(loggedinUser);
      } else {
        Navigator.pushNamed(context, WelcomeScreen.id);
      }
    } catch (e) {
      print(e);
    }
  }

// Listen to data changes from firestore ( STREAMS)
// Subscribe yourself to the stream,You are gonna notified automatically
// once there is a new push to the stream
// snapshots : retun  a list of Futures ( A stream )

  void getStream() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var message in snapshot.docs.reversed) {
        print(message.data());
      }
    }
  }

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                __auth.signOut(); // SignOut Functionality
                Navigator.pop(context);
                //getStream();
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(_firestore),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        textMessage = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      _firestore.collection('messages').add({
                        'text': textMessage,
                        'sender': loggedinUser.email,
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble(this.sender, this.text);
  final String sender;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: loggedinUser.email == sender
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.end,
            children: [
              sender != loggedinUser.email
                  ? Text(
                      sender,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                      ),
                    )
                  : SizedBox(),
              Material(
                elevation: 5,
                color: sender == loggedinUser.email
                    ? Colors.black
                    : Colors.lightBlueAccent,
                borderRadius: BorderRadius.only(
                  topLeft: loggedinUser.email == sender
                      ? Radius.circular(0)
                      : Radius.circular(30),
                  topRight: loggedinUser.email == sender
                      ? Radius.circular(30)
                      : Radius.circular(0),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class MessageStream extends StatelessWidget {
  MessageStream(this._firestore);
  final _firestore;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      // We added this specific type in order to use its internal properties
      stream: _firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        // This snapshot contains all data returned stored in steam
        // The return of FireStore stream is a list of snapshots
        final messages = snapshot.data.docs;
        List<MessageBubble> messageWidgets = [];
        if (!snapshot.hasData) {
          return Center(
              child: CircularProgressIndicator(
            backgroundColor: Colors.lightBlueAccent,
          ));
        }

        for (var message in messages) {
          final Map<String, dynamic> data = message.data();
          messageWidgets.add(MessageBubble(data["sender"], data["text"]));
        }
        return Expanded(
          child: ListView(
            reverse: true,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: messageWidgets,
              ),
            ],
          ),
        );
      },
    );
  }
}

/**
 * Store Data to the fireStore : 
 * 1.  Head to the firestore and create a new database ( with new collections)
 *  each collection is like an excel sheet . the database might have multiple collections as long 
 * as the excel document might have multiple sheets. 
  
 * 2. Create an instance of Firestore   and use it to push and fetch new data and streams 

 * Turn your stream into Widgets using StreamBuilder widget that returns a widget

 */
