import 'package:flutter/material.dart';
import 'package:gym_guide_application/app_state_page.dart';
import 'package:gym_guide_application/widgets/exercise_card_widget.dart';

import '../model/exercise_model.dart';

class ExerciseListPage extends StatefulWidget {
  static String routeName = "/exerciseListPage";

  const ExerciseListPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ExerciseListPage> createState() => _ExerciseListPageState();
}

class _ExerciseListPageState extends State<ExerciseListPage> {
  // final ExerciseModel exerciseModel = exerciseList[0];

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final title = args["title"];
    final List<ExerciseModel> listOfExercise = args["listOfExercise"];
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        child: listOfExercise.isEmpty
            ? Center(
                child: Text(
                  "No exercises with difficulty level : ${AppState.difficultyLevel} and equipment type : ${AppState.selectedEquipment.name}",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
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
              ),
      ),
    );
  }
}
