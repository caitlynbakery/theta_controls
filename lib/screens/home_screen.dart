import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../format_json.dart';
import 'package:theta4/buttons/info_button.dart';
import 'package:theta4/buttons/show_picture_button.dart';
import 'package:theta4/buttons/state_button.dart';
import 'package:theta4/buttons/take_picture_button.dart';
import 'package:theta4/buttons/show_full_image.dart';
import 'package:theta4/buttons/list_files_button.dart';
import 'package:theta4/buttons/set_video_mode_button.dart';
import 'package:theta4/buttons/set_image_mode_button.dart';
import 'package:theta4/buttons/start_video_button.dart';
import 'package:theta4/buttons/stop_video_button.dart';
import 'package:theta4/buttons/show_5_thumbnail_button.dart';
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
              ShowPictureButton(),
              ShowFullImage(),
              ListFilesButton(),
              SetVideoModeButton(),
              SetImageModeButton(),
            ],
          ),
          Row(children: [
            StartVideoButton(),
            StopVideoButton(),
            Show5ThumbnailButton(),
          ],),
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
                        child: GestureDetector(
                          onTap: (){
Navigator.of(context).pushNamed('/picture', arguments: Provider.of<CameraNotifier>(context, listen: false).latestFileUrl);
                          },
                          child: Image.network(
                            Provider.of<CameraNotifier>(context)
                                .latestFileUrl + "?type=thumb"),
                        )
                      ),
                // ListView.builder(
                //   itemCount: Provider.of<CameraNotifier>(context).lastFiveUrl.length,
                //   itemBuilder: (context, index) {
                //     return Image.network(Provider.of<CameraNotifier>(context).lastFiveUrl[index]);
                //   },
                // )

                Provider.of<CameraNotifier>(context).lastFiveUrl.length == 0 ? Container() : Container(
                  width: 400,
                  child: ListView(
                    children: [
                     Container(child: Image.network(Provider.of<CameraNotifier>(context).lastFiveUrl[0] + "?type=thumb"),),
                     Container(child: Image.network(Provider.of<CameraNotifier>(context).lastFiveUrl[1] + "?type=thumb")),
                     Container(child: Image.network(Provider.of<CameraNotifier>(context).lastFiveUrl[2] + "?type=thumb")),
                     Container(child: Image.network(Provider.of<CameraNotifier>(context).lastFiveUrl[3] + "?type=thumb")),
                     Container(child: Image.network(Provider.of<CameraNotifier>(context).lastFiveUrl[4] + "?type=thumb"))


                    ]
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
