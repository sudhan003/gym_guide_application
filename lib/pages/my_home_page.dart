import 'package:flutter/material.dart';

import 'package:gym_guide_application/app_state_page.dart';

import '../data/exercise.dart';
import '../data/workout_category_list.dart';
import '../model/exercise_model.dart';
import '../widgets/exercise_card_widget.dart';
import '../widgets/workout_category_widget.dart';
import 'bmi_calculator_page.dart';
import 'filter_page.dart';

class MyHomePage extends StatefulWidget {
  static String routeName = "/myHomePage";

  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;

  @override
  void initState() {
    AppState.sharedPrefs;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List listOfFavouriteExercise = AppState.sharedPrefs
        .getFavouriteExerciseId()
        .map((e) =>
            exerciseList.where((element) => element.name == e).toList().first)
        .toList();
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              color: const Color(0xFF322751),
              child: const Padding(
                padding: EdgeInsets.only(top: 50, left: 20),
                child: Text(
                  "GYMGUIDE",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text("BMI Calculator"),
              onTap: () {
                Navigator.of(context).pushNamed(BmiCalculatorPage.routeName);
              },
            ),
            const Divider(),
            ListTile(
              title: const Text("Filter"),
              onTap: () {
                Navigator.of(context).pushNamed(FilterPage.routeName);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          _index = value;
          setState(() {});
        },
        currentIndex: _index,
        items: const [
          BottomNavigationBarItem(
            label: "Category",
            icon: Icon(
              Icons.category,
            ),
          ),
          BottomNavigationBarItem(
            label: "Favourite",
            icon: Icon(
              Icons.favorite,
            ),
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text(
          "Welcome Anmol",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(
              right: 10,
            ),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                "assets/user_image.jpeg",
              ),
            ),
          ),
          // Image.asset("assets/user_image.jpeg"),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              _index == 0 ? "Workout Categories" : "Favourite Exercise",
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25,
                fontStyle: FontStyle.italic,
              ),
            ),
            const Divider(color: Colors.black),
            // ...workoutCategoryList
            //     .map((e) => WorkoutCategoryWidget(workoutCategoryModel: e))
            //     .toList(),
            _index == 0
                ? Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => WorkoutCategoryWidget(
                        workoutCategoryModel: workoutCategoryList[index],
                      ),
                      itemCount: workoutCategoryList.length,
                    ),
                  )
                : listOfFavouriteExercise.isEmpty
                    // exerciseList
                    //             .where((element) => element.isFavourite)
                    //             .toList()
                    //             .isEmpty

                    ? const SizedBox(
                        height: 500,
                        child: Center(
                          child: Text(
                            "No exercise marked as favourite",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    : Expanded(
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 20,
                            );
                          },
                          itemBuilder: (context, index) => ExerciseCardWidget(
                              exerciseModel: listOfFavouriteExercise[index]),
                          itemCount: listOfFavouriteExercise.length,
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
