import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:connectivity/connectivity.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'dart:io';


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
  late StreamSubscription sub;
   bool isConnected = false ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sub = Connectivity().onConnectivityChanged.listen((ConnectivityResult res) {
      isConnected = (res != ConnectivityResult.none);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
    sub.cancel();
  }

  @override
  Widget build(BuildContext context) {
    // if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
    //   return WebviewScaffold(
    //
    //     url: 'http://www.storebeverage.com',
    //     withJavascript: true,
    //     appCacheEnabled: true,
    //     geolocationEnabled: true,
    //     withZoom: true,
    //     ignoreSSLErrors: true,
    //   );
    // }
    // else {
    //   return Scaffold(
    //
    //       body: Center(
    //     child: Text(
    //       'Internet non disponible',
    //       style: TextStyle(color: Colors.red[900], fontSize: 25.0),
    //     ),
    //   ));
    // }

    if (isConnected == false) {
      return Scaffold(
        body:

        Padding(
          padding: const EdgeInsets.only(top:300),
          child: Center(

            child: Column(

              children: [

                Icon(
                  Icons.wifi_off,
                  size: 60,
                ),
                ElevatedButton(

                    onPressed: () {
                      exit(0);
                    },
                    child: Text('Fermer')
                ),

              ],
            ),
          ),
        ),
      );
    }
    else {
      return  WebviewScaffold(

              url: 'http://www.storebeverage.com',
              withJavascript: true,
              appCacheEnabled: true,
              geolocationEnabled: true,
              withZoom: true,
              ignoreSSLErrors: true,
              );
    }






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
