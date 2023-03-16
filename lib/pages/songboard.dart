import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../utils/utils.dart';
import '../widgets/circle_play_button.dart';
import '../widgets/rectangle_button.dart';

class SongBoard extends StatefulWidget {
  const SongBoard({
    super.key,
    required this.musicName,
    required this.musicSource,
    required this.imageSource,
  });

  final String musicName;
  final String musicSource;
  final String imageSource;

  @override
  State<SongBoard> createState() => _SongBoardState();
}

class _SongBoardState extends State<SongBoard> {
  final player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  String musicName = '';
  String musicSource = '';
  String imageSource = '';

  @override
  void initState() {
    super.initState();
    updateUI(
      widget.musicName,
      widget.musicSource,
      widget.imageSource,
    );

    setAudio();
    // listion to state playing, paused, stop
    player.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.playing;
      });
    });

    // Listen to duration position
    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    // listen to audion position
    player.onPositionChanged.listen((newPostion) {
      setState(() {
        position = newPostion;
      });
    });
  }

  void updateUI(
    String newMusicName,
    String newMusicSource,
    String newImageSource,
  ) {
    musicName = newMusicName;
    musicSource = newMusicSource;
    imageSource = newImageSource;
    return;
  }

  Future setAudio() async {
    AssetSource source = AssetSource('musics/$musicSource');
    await player.play(source);
    // repeat the music
    player.setReleaseMode(ReleaseMode.loop);
    player.setSource(source);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/$imageSource',
                    width: double.infinity,
                    height: 350,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  musicName,
                  style: kLargeTextStyle,
                ),
                Slider(
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  activeColor: Colors.deepPurple,
                  inactiveColor: Colors.deepPurple[200],
                  onChanged: (value) async {
                    final position = Duration(seconds: value.toInt());
                    await player.seek(position);
                    await player.resume();
                  },
                ),
                CirclePlayButton(isPlaying: isPlaying, player: player),
                const SizedBox(
                  height: 120,
                ),
                RectangleButton(
                  onPressed: () async {
                    await player.stop();
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "GO TO DASHBOARD",
                    style: kButtonTextStyle,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
