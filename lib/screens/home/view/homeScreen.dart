import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacherday/screens/home/provider/homeProvider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  AssetsAudioPlayer? assetsAudioPlayer;
  HomeProvider? homeProviderTrue;
  HomeProvider? homeProviderFalse;

  @override
  void initState() {
    super.initState();

    assetsAudioPlayer = AssetsAudioPlayer();

    playAudio();
  }

  void playAudio() async {
    await assetsAudioPlayer!
        .open(Audio("assets/audio/ring.mp3"), autoStart: false);

    assetsAudioPlayer!.current.listen((event) {
      Provider.of<HomeProvider>(context, listen: false)
          .getDuration(event!.audio.duration);
    });
  }

  @override
  Widget build(BuildContext context) {
    homeProviderTrue = Provider.of<HomeProvider>(context, listen: true);
    homeProviderFalse = Provider.of<HomeProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  homeProviderFalse!.changeState();

                  if (homeProviderFalse!.isPlay == true) {
                    assetsAudioPlayer!.play();
                  } else {
                    assetsAudioPlayer!.pause();
                  }
                },
                icon: homeProviderTrue!.isPlay == false
                    ? Icon(Icons.play_circle)
                    : Icon(Icons.pause_circle),
              ),
              SizedBox(
                height: 30,
              ),
              assetsAudioPlayer!.builderCurrentPosition(
                builder: (contetx, duration) {
                  return Column(
                    children: [
                      Slider(
                        value: duration.inSeconds.toDouble(),
                        onChanged: (value) {
                          assetsAudioPlayer!.seek(Duration(seconds: value.toInt()));
                        },
                        max:
                            homeProviderFalse!.endDuration.inSeconds.toDouble(),
                      ),
                      Text("$duration/${homeProviderTrue!.endDuration}"),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
