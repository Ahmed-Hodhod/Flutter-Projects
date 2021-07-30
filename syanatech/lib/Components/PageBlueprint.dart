import 'package:flutter/material.dart';
import 'package:syanatech/constants.dart';

class PageTemplate extends StatelessWidget {
  PageTemplate({required this.childWidget, required this.title});
  final Widget childWidget;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.all(0),
              title: Center(
                  child: Text(
                title,
                style: TextStyle(color: kBlueColor),
              )),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: childWidget,
          ),
        ],
      ),
    );
  }
}
