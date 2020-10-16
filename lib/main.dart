import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => MainResponseWindow(),
    )
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

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Theta App"),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlatButton(
                    onPressed: () async {
                      var response =
                          await http.get('http://192.168.1.1/osc/info');
                      var responseBody = response.body.toString();

                      context
                          .read<MainResponseWindow>()
                          .updateResponseWindow(responseBody);
                    },
                    child: Text("Info"),
                    color: Colors.teal[200],
                  ),
                )
              ],
            ),
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 300,
                    child: SingleChildScrollView(
                      child: Text(Provider.of<MainResponseWindow>(context)
                          .responseText),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
