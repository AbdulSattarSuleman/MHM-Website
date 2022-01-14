import 'package:flutter/material.dart';
import 'package:mhm_website/screens/widgets/responsive.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _videoController;
  late Future<void> _video;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset(
        "https://drive.google.com/file/d/15BP-M4-1rsZPOYxFJ6gntqI_5Fi2cn2m/view?usp=sharing");
    _video = _videoController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return FutureBuilder(
        future: _video,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ResponsiveWidget.isSmallScreen(context)
                ? Column(
                    children: [
                      Container(
                        width: screenSize.width,
                        height: screenSize.width / 1.5,
                        color: Colors.green,
                        child: Center(
                          child: AspectRatio(
                            aspectRatio: _videoController.value.aspectRatio,
                            child: VideoPlayer(_videoController),
                          ),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (_videoController.value.isPlaying) {
                              setState(() {
                                _videoController.pause();
                              });
                            } else {
                              setState(() {
                                _videoController.play();
                              });
                            }
                          },
                          child: Icon(_videoController.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow)),
                    ],
                  )
                : Column(
                    children: [
                      Container(
                        width: screenSize.width,
                        height: screenSize.width / 4.5,
                        color: Colors.green,
                        child: Center(
                          child: AspectRatio(
                            aspectRatio: _videoController.value.aspectRatio,
                            child: VideoPlayer(_videoController),
                          ),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (_videoController.value.isPlaying) {
                              setState(() {
                                _videoController.pause();
                              });
                            } else {
                              setState(() {
                                _videoController.play();
                              });
                            }
                          },
                          child: Icon(_videoController.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow)),
                    ],
                  );
          } else {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoController.dispose();
  }
}
