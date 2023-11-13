import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gym_guide_app/model/exercise_model.dart';
import 'package:collection/collection.dart';
import 'package:audioplayers/audioplayers.dart';

class ExerciseDetailPage extends StatefulWidget {
  final Function(ExerciseModel) toggleFavourite;
  static String routeName = "/exerciseDetailPage";
  const ExerciseDetailPage({Key? key, required this.toggleFavourite})
      : super(key: key);

  @override
  State<ExerciseDetailPage> createState() => _ExerciseDetailPageState();
}

class _ExerciseDetailPageState extends State<ExerciseDetailPage> {
  bool startExercise = false;
  final audiPlayer = AudioPlayer();
  int duration = 30;
  late Timer timer;

  void playAudio() async => await audiPlayer.play(AssetSource('let_go.mp3'));
  void pauseAudio() async => await audiPlayer.pause();
  void stopAudio() async => await audiPlayer.stop();
  start() {
    playAudio();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (duration > 0) {
        duration -= 1;
        setState(() {});
      } else {
        stopAudio();
        timer.cancel();
        startExercise = false;
        setState(() {});
      }
    });
  }

  pause() {
    pauseAudio();
    timer.cancel();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    timer = Timer(Duration(), () {});
  }

  @override
  Widget build(BuildContext context) {
    final exerciseModel =
        ModalRoute.of(context)!.settings.arguments as ExerciseModel;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(duration.toString()),
        actions: [
          GestureDetector(
              onTap: () {
                if (!startExercise) {
                  start();
                  setState(() {
                    startExercise = true;
                  });
                } else {
                  pause();
                  setState(() {
                    startExercise = false;
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  startExercise ? Icons.pause_circle : Icons.play_circle,
                  size: 40,
                ),
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.toggleFavourite(exerciseModel);
        },
        backgroundColor: Colors.white,
        child: Icon(
          exerciseModel.isFavourite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: ListView(
          children: [
            Image.network(
              exerciseModel.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Text(
              exerciseModel.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            ...exerciseModel.steps
                .mapIndexed((index, e) => ListTile(
                      title: Text(e),
                      leading: CircleAvatar(
                        child: Text(
                          (index + 1).toString(),
                        ),
                      ),
                    ))
                .toList(),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Targeted Muscle",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: exerciseModel.targetMuscles
                  .map(
                    (e) => Card(
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          e,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Equipment",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: exerciseModel.equipment
                  .map(
                    (e) => Card(
                      color: const Color(0xFF322751),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          e,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.repeat,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(exerciseModel.sets),
                  ],
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Icon(
                        Icons.fitness_center,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(exerciseModel.reps),
                  ],
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: Icon(
                        Icons.timer,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(exerciseModel.duration),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
