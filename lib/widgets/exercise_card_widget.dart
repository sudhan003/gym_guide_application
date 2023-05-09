import 'package:flutter/material.dart';
import 'package:gym_guide_application/model/exercise_model.dart';
import 'package:gym_guide_application/pages/exercise_detail_page.dart';

class ExerciseCardWidget extends StatelessWidget {
  final ExerciseModel exerciseModel;

  const ExerciseCardWidget({Key? key, required this.exerciseModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            spreadRadius: 4,
          ),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(ExerciseDetailPage.routeName,
              arguments: exerciseModel);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(5),
                topLeft: Radius.circular(5),
              ),
              child: Image.network(
                exerciseModel.imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    exerciseModel.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: List.generate(
                        5,
                        (index) => index + 1 <= exerciseModel.difficulty
                            ? const Icon(
                                Icons.star,
                                size: 15,
                                color: Colors.orange,
                              )
                            : const Icon(
                                Icons.star_border,
                                size: 15,
                                color: Colors.orange,
                              )),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: exerciseModel.equipment.isEmpty
                  ? const Text(
                      "No Equipments",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    )
                  : Text(
                      "Equipments: ${exerciseModel.equipment.join(", ")}",
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
