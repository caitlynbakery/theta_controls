import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../format_json.dart';
import 'package:theta4/buttons/info_button.dart';
import 'package:theta4/buttons/show_picture_button.dart';
import 'package:theta4/buttons/state_button.dart';
import 'package:theta4/buttons/take_picture_button.dart';
import 'dart:convert';
import '../main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theta App"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              InfoButton(),
              StateButton(),
              TakePictureButton(),
              ShowPictureButton()
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
                ),
                Provider.of<CameraNotifier>(context).latestFileUrl == ""
                    ? Container()
                    : Container(
                        width: 500,
                        child: Image.network(
                            Provider.of<CameraNotifier>(context)
                                .latestFileUrl + "?type=thumb"),
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}
