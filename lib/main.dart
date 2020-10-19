import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import './format_json.dart';
import 'buttons/info_button.dart';
import 'buttons/state_button.dart';
import 'dart:convert';

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
                InfoButton(),
                StateButton(),
                Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlatButton(
        onPressed: () async {
          var body = json.encode({'name': 'camera.takePicture'});
          var response =
              await http.post('http://192.168.1.1/osc/commands/execute', body: body);
          var responseBody = formatJson(response.body.toString());

          context
              .read<MainResponseWindow>()
              .updateResponseWindow(responseBody);
        },
        child: Text("Take Picture"),
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



