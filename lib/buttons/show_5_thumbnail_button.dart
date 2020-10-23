import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../format_json.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import 'dart:convert';

class Show5ThumbnailButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlatButton(
        onPressed: () async {
          var body =
              json.encode({'name': 'camera.listFiles', 'parameters': {
                'fileType': 'image',
                'entryCount': 5,
                'maxThumbSize': 0,
              }});
          var response = await http
              .post('http://192.168.1.1/osc/commands/execute', body: body);

          var responseBody = json.decode(response.body);

          var listAllData = responseBody['results']['entries'];

          var urlArray = [];

          for(var i = 0; i <listAllData.length; i++){
            urlArray.add(listAllData[i]['fileUrl']);
            
          }
          
          context
            .read<CameraNotifier>()
            .updateLastFiveUrl(urlArray);

          print(urlArray);


          // context
          //     .read<MainResponseWindow>()
          //     .updateResponseWindow(responseBody);

        },
        child: Text('Show 5 Thumbnail'),
        color: Colors.teal[200],
      ),
    );
  }
}