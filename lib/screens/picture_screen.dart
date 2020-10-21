import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theta4/main.dart';
import 'package:panorama/panorama.dart';

class PictureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Picture Display'),
        ),
        body: Provider.of<CameraNotifier>(context).latestFileUrl == ""
            ? Container(child: Text("nothing"))
            : Panorama(
              child: Image.network(
                  Provider.of<CameraNotifier>(context).latestFileUrl),
            )
        // Image.network(Provider.of<CameraNotifier>(context).latestFileUrl),

        );
  }
}