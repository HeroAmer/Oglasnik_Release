import 'package:Oglasnik/utils/globals.dart';

import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

Map internetSource = {ConnectivityResult.none: false};
MyConnectivity internetConnectivity = MyConnectivity.instance;
void connectivityInitmethod() {
  internetConnectivity.initialise();
}

class InternetConnection extends StatefulWidget {
  @override
  _InternetConnectionState createState() => _InternetConnectionState();
}

class _InternetConnectionState extends State<InternetConnection> {
  @override
  void initState() {
    super.initState();
    connectivityInitmethod();
    internetConnectivity.myStream.listen((source) {
      setState(() => internetSource = source);
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (internetSource.keys.toList()[0]) {
      case ConnectivityResult.none:
        isOnline = true;
        string = "Offline";
        break;
      case ConnectivityResult.mobile:
        isOnline = false;
        string = "Mobile: Online";
        break;
      case ConnectivityResult.wifi:
        isOnline = false;
        string = "WiFi: Online";
    }

    return Container();
  }

  @override
  void dispose() {
    internetConnectivity.disposeStream();
    super.dispose();
  }
}

class MyConnectivity {
  MyConnectivity._internal();

  static final MyConnectivity _instance = MyConnectivity._internal();

  static MyConnectivity get instance => _instance;

  Connectivity connectivity = Connectivity();

  StreamController controller = StreamController.broadcast();

  Stream get myStream => controller.stream;

  void initialise() async {
    ConnectivityResult result = await connectivity.checkConnectivity();
    _checkStatus(result);
    connectivity.onConnectivityChanged.listen((result) {
      _checkStatus(result);
    });
  }

  void _checkStatus(ConnectivityResult result) async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isOnline = true;
      } else
        isOnline = false;
    } on SocketException catch (_) {
      isOnline = false;
    }
    controller.sink.add({result: isOnline});
  }

  void disposeStream() => controller.close();
}
