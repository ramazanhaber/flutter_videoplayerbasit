import 'package:flutter/material.dart';

import 'SingleVideo.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String url="";
  Widget videoYukle(String url){

    return SingleVideo(url: url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("asd"),),
      body: Column(children: [
        ElevatedButton(onPressed: (){
          this.url="https://roketnot.com/out/yeni.mp4";
          setState(() {

          });
        }, child: Text("Video1")),
        ElevatedButton(onPressed: (){
this.url="";
setState(() {

});
          this.url="https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4";

setState(() {

});

        }, child: Text("Video2")),

        Expanded(child: Container(child: url==""?Container():SingleVideo(url: url)))
      ],),
    );
  }
}
