import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../format_json.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import 'dart:convert';

class StartVideoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlatButton(
        onPressed: () async {
          var body =
              json.encode({'name': 'camera.startCapture', 'parameters': {}});
          var response = await http
              .post('http://192.168.1.1/osc/commands/execute', body: body);

          var responseBody = formatJson(response.body.toString());

          context
              .read<MainResponseWindow>()
              .updateResponseWindow(responseBody);
        },
        child: Text('Start Video Capture'),
        color: Colors.teal[200],
      ),
    );
  }
}