import 'package:flutter/material.dart';
import 'package:gym_guide_app/app_state.dart';
import 'package:gym_guide_app/model/exercise_model.dart';
import 'package:gym_guide_app/widgets/exericse_card_widget.dart';

class ExerciseListPage extends StatelessWidget {
  static String routeName = "/exerciseListPage";
  const ExerciseListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String title = args["title"];
    final List<ExerciseModel> listOfExercise = args["listOfExercise"];

    // final ExerciseModel exerciseModel = exerciseList[0];//
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: listOfExercise.isEmpty
              ? Center(
                  child: Text(
                    "No Exercise with diffcuilty level:${AppState.difficuiltyLevel},equipment type: ${AppState.selectedEquipment.name}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
              : ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ExerciseCardWidget(
                      exerciseModel: listOfExercise[index],
                    );
                  },
                  itemCount: listOfExercise.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                )),
    );
  }
}
