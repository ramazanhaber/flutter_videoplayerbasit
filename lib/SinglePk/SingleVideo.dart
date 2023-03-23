import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


/// Stateful widget to fetch and then display video content.
class SingleVideo extends StatefulWidget {
  String url="";
   SingleVideo({required this.url});

  @override
  _SingleVideoState createState() => _SingleVideoState();
}

class _SingleVideoState extends State<SingleVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        widget.url)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });

    // _controller.setLooping(true);
    _controller.addListener(checkVideo);
  }

  void checkVideo(){
    // Implement your calls inside these conditions' bodies :
    if(_controller.value.position == Duration(seconds: 0, minutes: 0, hours: 0)) {
      print('video Started');
      setState(() {
        
      });
    }

    if(_controller.value.position == _controller.value.duration) {
      print('video Ended');
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : Center(child: Container(child: CircularProgressIndicator(),)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}