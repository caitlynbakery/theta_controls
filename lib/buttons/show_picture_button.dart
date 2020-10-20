import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../format_json.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import 'dart:convert';

class ShowPictureButton extends StatelessWidget {
  const ShowPictureButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlatButton(
        onPressed: () async {
          var response =
              await http.post('http://192.168.1.1/osc/state');
          var responseBody = jsonDecode(response.body);
          var fileUrl = responseBody['state']['_latestFileUrl'];

          context.read<CameraNotifier>().updateUrl(fileUrl);

          print(fileUrl);
        },
        child: Text('Show Thumbnail'),
        color: Colors.teal[200],
      ),
    );
  }
}
