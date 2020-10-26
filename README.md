# Theta App

I used response and request controls to manage the camera. I used the following:

* [Theta Info API](https://api.ricoh/docs/theta-web-api-v2.1/protocols/info/)
* [Provider](https://pub.dev/packages/provider)
* [http](https://pub.dev/packages/http)

TODO: 
* ListView.builder 
* attempt to change 5 other urls. 
    * change image view so it uses the url we pass it 

PROBLEM:
An error message shows up when I try to show 5 thumbnails and click on a thumbnail image. Could be relating
to varying speeds of request methods. 

I implemented a picture screen transition. When I click on a thumbnail, it shows the full image. 
The first step was to wrap my `Image.network` inside of a GestureDetector class. 
I then used the onTap method to push the picture screen on top of the home screen when the thumbnail is pressed. I also passed the latestFileUrl as an argument. 

```dart
child: GestureDetector(
    onTap: (){
        Navigator.of(context).pushNamed('/picture', arguments: Provider.of<CameraNotifier>(context, listen: false).latestFileUrl);
    },
    child: Image.network(
    Provider.of<CameraNotifier>(context)
        .latestFileUrl + "?type=thumb"),
)
```