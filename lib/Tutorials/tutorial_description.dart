import 'package:flutter/material.dart';
import 'package:liftlog/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DiscriptionScreen extends StatefulWidget {
  final Map<String, dynamic> tutorialSnapshot;

  const DiscriptionScreen({super.key, required this.tutorialSnapshot});

  @override
  State<DiscriptionScreen> createState() => _DiscriptionScreenState();
}

class _DiscriptionScreenState extends State<DiscriptionScreen> {
  YoutubePlayerController? _controller;
  bool _isVideoAvailable = false;

  @override
  void initState() {
    super.initState();

    final String videoUrl = widget.tutorialSnapshot['videourl'] ?? '';
    final String? videoId = YoutubePlayer.convertUrlToId(videoUrl);

    if (videoId != null && videoId.isNotEmpty) {
      // Initialize the YouTube player controller only if the video ID is valid
      _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      );
      _isVideoAvailable = true;
    } else {
      _isVideoAvailable = false; // No valid video ID
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tutorialSnapshot['name'] ?? 'Description'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_isVideoAvailable)
                YoutubePlayer(
                  controller: _controller!,
                  showVideoProgressIndicator: true,
                )
              else
                const Text(
                  "No video available for this exercise.",
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.ThemeColor,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        widget.tutorialSnapshot['name'] ?? 'No name provided',
                        style:
                             const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                      const SizedBox(height: 16),
                  Row(children: [
                    const Text(
                      "Target Muscle: ",
                      style:  TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                    Text(
                      widget.tutorialSnapshot['muscle'] ?? 'Not provided',
                      style:  const TextStyle(fontSize: 20,color: Colors.white),
                    )
                  ]),
                  const SizedBox(height: 16),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                      "Description: ",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                      Text(
                        widget.tutorialSnapshot['description'] ??
                            'No description provided',
                        style:  const TextStyle(fontSize: 20,color: Colors.white),
                      ),
                    ],
                  ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
