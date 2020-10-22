import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/picture_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => MainResponseWindow(),
    ),
    ChangeNotifierProvider(create: (_) => CameraNotifier())
  ], child: MyApp()));
}

class MainResponseWindow with ChangeNotifier {
  String _responseText = "";
  String get responseText => _responseText;

  void updateResponseWindow(response) {
    _responseText = response;
    notifyListeners();
  }
}

class CameraNotifier with ChangeNotifier {
  String _latestFileUrl = "";
  var _lastFiveUrl = [];
  String get latestFileUrl => _latestFileUrl;

  List<dynamic> get lastFiveUrl => _lastFiveUrl;

  void updateLastFiveUrl(url) {
    _lastFiveUrl = url;
    notifyListeners();
  }

  void updateUrl(url) {
    _latestFileUrl = url;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      routes: {
        '/': (context) => HomeScreen(),
        '/picture': (context) => PictureScreen(),
      },
      initialRoute: '/',
    );
  }
}


