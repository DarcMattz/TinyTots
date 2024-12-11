import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:tinytots/components/top_bar.dart';
import 'package:tinytots/gen/assets.gen.dart';
import 'package:tinytots/helper/audio_service.dart';
import 'package:tinytots/screens/explore.dart';
import 'package:tinytots/screens/learning.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return AndroidScreen(constraints: constraints);
      }),
    );
  }
}

class AndroidScreen extends StatefulWidget {
  final BoxConstraints constraints;

  const AndroidScreen({
    required this.constraints,
    super.key,
  });

  @override
  State<AndroidScreen> createState() => _AndroidScreenState();
}

class _AndroidScreenState extends State<AndroidScreen> {
  final AudioService _audioService = AudioService();

  @override
  void initState() {
    super.initState();
    refreshScreen();
    _audioService.playBG();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _audioService.dispose();
  }

  void refreshScreen() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.images.background.provider(),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            TopBar(oldScreen: HomeScreen()),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LearningListScreen()));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      width: widget.constraints.maxWidth * 0.6,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 0),
                      decoration: BoxDecoration(
                        color: Color(0xffA77DFE),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Text(
                        'Learning is Fun',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    // const SizedBox(height: 10),
                    Assets.images.learning.image(
                      height: widget.constraints.maxHeight * 0.2,
                      width: widget.constraints.maxWidth * 0.6,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ExploreListScreen()),
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      width: widget.constraints.maxWidth * 0.6,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 0),
                      decoration: BoxDecoration(
                        color: Color(0xffA77DFE),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Text(
                        "Let's Explore More",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Assets.images.explorePng.image(
                      height: widget.constraints.maxHeight * 0.2,
                      width: widget.constraints.maxWidth * 0.6,
                    ),
                  ],
                ),
              ),
            ),
            // const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Assets.images.lion.image(
                //   height: widget.constraints.maxHeight * 0.2,
                //   // width: constraints.maxWidth * 0.6,
                // ),
                Assets.images.gif.raccoon.image(
                  height: widget.constraints.maxHeight * 0.2,
                  width: widget.constraints.maxWidth * 0.6,
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
