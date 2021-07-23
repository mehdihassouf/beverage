import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:connectivity/connectivity.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'dart:io';



var connectivityResult = await (Connectivity().checkConnectivity());
await(Future<ConnectivityResult> checkConnectivity) {}


void main() {
  runApp(
        MyApp(),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splashTransition: SplashTransition.slideTransition,
        duration: 3000,
        splash: Image.asset(
  'assets/images/beverage.png'
        ),
        nextScreen: Main(),
      ),
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  bool _isConnected = false ;
  Future<void> _checkInternetConnection() async {
    try {
      final response = await InternetAddress.lookup('www.kindacode.com');
      if (response.isNotEmpty) {
        setState(() {
          _isConnected = true;
        });
      }
    } on SocketException catch (err) {
      setState(() {
        _isConnected = false;
      });
      print(err);
    }
  }
 @override
 void initState() {
   _checkInternetConnection();
   super.initState();
 }
  @override
  Widget build(BuildContext context) {

    // if (connectivityResult == ConnectivityResult.mobile ) {
    //   // return WebviewScaffold(
    //   //
    //   //   url: 'http://www.storebeverage.com',
    //   //   withJavascript: true,
    //   //   appCacheEnabled: true,
    //   //   geolocationEnabled: true,
    //   //   withZoom: true,
    //   //   ignoreSSLErrors: true,
    //   // );
    //   return Center(child:Text(connectivityResult));
    // }
    // else if( connectivityResult == ConnectivityResult.wifi){
    //   // return WebviewScaffold(
    //   //
    //   //   url: 'http://www.storebeverage.com',
    //   //   withJavascript: true,
    //   //   appCacheEnabled: true,
    //   //   geolocationEnabled: true,
    //   //   withZoom: true,
    //   //   ignoreSSLErrors: true,
    //   // );
    //   return  Center(child:Text(connectivityResult));
    // }
    // else{
    //   return Scaffold(
    //
    //       body: Center(
    //     // child: Text(
    //     //   'Internet non disponible',
    //     //   style: TextStyle(color: Colors.red[900], fontSize: 25.0),
    //     // ),
    //         child: FlatButton(
    //           child: Text('clickme'),
    //           onPressed: (){
    //             print(connectivityResult);
    //           },
    //         ),
    //   ));
    // }

if(_isConnected) {
  return WebviewScaffold(

        url: 'http://www.storebeverage.com',
        withJavascript: true,
        appCacheEnabled: true,
        geolocationEnabled: true,
        withZoom: true,
        ignoreSSLErrors: true,
  );
}else{
      return Scaffold(

          body: Center(
        child: Text(
          'Internet non disponible',
          style: TextStyle(color: Colors.red[900], fontSize: 25.0),
        ),
      )
      );
        }










    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Kindacode.com'),
    //   ),
    //   body: Center(
    //     child: Text(_isConnected == true ? 'Connected' : 'Not Connected',
    //         style: TextStyle(fontSize: 24)),
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //       onPressed: _checkInternetConnection, child: Icon(Icons.info)),
    // );
  }






  }


// WebviewScaffold(
//
// url: 'http://www.storebeverage.com',
// withJavascript: true,
// appCacheEnabled: true,
// geolocationEnabled: true,
// withZoom: true,
// ignoreSSLErrors: true,
// );
