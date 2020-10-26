
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theta4/main.dart';
import 'package:panorama/panorama.dart';

class PictureScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final fileUrl = ModalRoute.of(context).settings.arguments as String;

    print("printing from picture screen $fileUrl");
    return Scaffold(
        appBar: AppBar(
          title: Text('Picture Display'),
        ),
        body: fileUrl == ""
            ? Container(child: Text("nothing"))
            : Panorama(
              child: Image.network(
                  fileUrl,
                  // Provider.of<CameraNotifier>(context).latestFileUrl
                  ),
            )
        // Image.network(Provider.of<CameraNotifier>(context).latestFileUrl),

        );
  }
}
