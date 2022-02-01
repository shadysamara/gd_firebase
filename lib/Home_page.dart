import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gd_firebase/firestore/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String videoUrl = 'https://www.youtube.com/watch?v=8ZaFk0yvNlI';

  VideoPlayerController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.network(videoUrl);
    _controller.initialize().then((value) {
      _controller.play();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
              onPressed: () {
                // Provider.of<AuthProvider>(context, listen: false).logOut();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Container(
        child: VideoPlayer(_controller),
      ),
    );
  }
}
