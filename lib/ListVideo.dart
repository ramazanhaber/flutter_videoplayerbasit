import 'package:flutter/material.dart';
import 'package:video_box/video.controller.dart';
import 'package:video_box/video_box.dart';
import 'package:video_player/video_player.dart';

class ListVideo extends StatefulWidget {
  @override
  _ListVideoState createState() => _ListVideoState();
}

class _ListVideoState extends State<ListVideo> {
  List<VideoController> vcs = [];

  List<String> listVideo = [
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4"
  ];

  List<String> listBaslik = ["1. baslık","2. baslık","3.baslık"];

  @override
  void initState() {
    super.initState();

    listVideo.forEach((element) {
      vcs.add(VideoController(source: VideoPlayerController.network(element))
        ..initialize());
    });
  }

  @override
  void dispose() {
    for (var vc in vcs) {
      vc.dispose();
    }
    super.dispose();
  }
  int sayac=-1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('list video'),
      ),
      body: ListView(
        children: <Widget>[
          for (var vc in vcs)
           Column(children: [
             Text(listBaslik[sayac++]),
             Padding(
               padding: const EdgeInsets.only(top: 12.0),
               child: AspectRatio(
                 aspectRatio: 16 / 9,
                 child: VideoBox(controller: vc),
               ),
             )
           ],),
        ],
      ),
    );
  }
}
