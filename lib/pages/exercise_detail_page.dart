import 'package:flutter/material.dart';

import '../app_state_page.dart';
import '../model/exercise_model.dart';
import 'package:collection/collection.dart';

class ExerciseDetailPage extends StatelessWidget {
  static String routeName = "/exerciseDetailPage";
  final Function(ExerciseModel) toggleFavourite;

  const ExerciseDetailPage({Key? key, required this.toggleFavourite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final exerciseModel =
        ModalRoute.of(context)!.settings.arguments as ExerciseModel;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          toggleFavourite(exerciseModel);
          AppState.sharedPrefs.addExerciseIdToList(exerciseModel.name);
        },
        child: Icon(
          exerciseModel.isFavourite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
      ),
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
        child: ListView(
          physics: const BouncingScrollPhysics(),
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
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            ...exerciseModel.steps
                .mapIndexed(
                  (index, e) => ListTile(
                    title: Text(e),
                    leading: CircleAvatar(
                      child: Text((index + 1).toString()),
                    ),
                  ),
                )
                .toList(),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Targeted Muscles",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: exerciseModel.targetMuscles
                  .map((e) => Card(
                        color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            e,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Equipments",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: exerciseModel.equipment
                  .map((e) => Card(
                        color: const Color(0xFF311B92),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            e,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ))
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
                    Text(exerciseModel.sets)
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
                    Text(
                      exerciseModel.reps,
                    )
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
                    Text(
                      exerciseModel.duration,
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
