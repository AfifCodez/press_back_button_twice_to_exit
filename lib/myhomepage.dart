import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime timeBackPressed = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final difference = DateTime.now().difference(timeBackPressed);
        final isExitWarning = difference >= Duration(seconds: 2);

        timeBackPressed = DateTime.now();

        if (isExitWarning) {
          final message = 'Press back again to exit';
          Fluttertoast.showToast(
              backgroundColor: Colors.grey.withOpacity(0.5),
              msg: message,
              fontSize: 16,
              textColor: Colors.white);

          return false;
        } else {
          Fluttertoast.cancel();

          return true;
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Exit Using WillPopScope',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Center(
            child: Text(
              'Press back button twice to exit from the app...',
            ),
          ),
        ),
      ),
    );
  }
}
