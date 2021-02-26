import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {

  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayer;

  @override
  void initState() {
   _controller = VideoPlayerController.network(
     "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4"
   );
   _initializeVideoPlayer = _controller.initialize();
   _controller.setLooping(true);
   _controller.setVolume(1.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: _initializeVideoPlayer,
          builder: (context , snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return ListView.builder(
              itemCount: 4,
                itemBuilder: (context , index){
                return  Center(
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                );

                }


            );
          }
          return Center(child: CircularProgressIndicator());
          }
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child:
        Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}
