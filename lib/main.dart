import 'package:flutter/material.dart';
import 'package:gym_guide_application/model/exercise_model.dart';
import 'package:gym_guide_application/pages/bmi_calculator_page.dart';
import 'package:gym_guide_application/pages/exercise_detail_page.dart';
import 'package:gym_guide_application/pages/exercise_list_page.dart';
import 'package:gym_guide_application/pages/filter_page.dart';

import 'data/exercise.dart';
import 'pages/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _toggleIsFavourite(ExerciseModel exerciseModel) {
    ExerciseModel model = exerciseList
        .firstWhere((element) => element.name == exerciseModel.name);

    setState(() {
      model.isFavourite = !model.isFavourite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            labelStyle: const TextStyle(
              color: Color(0xFF311B92),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xFF311B92),
              ),
            ),
          ),
          sliderTheme: const SliderThemeData(
              activeTrackColor: Color(0xFF311B92),
              activeTickMarkColor: Color(0xFF311B92),
              thumbColor: Color(0xFF311B92)),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Color(0xFF311B92),
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF311B92),
          ),
        ),
        initialRoute: MyHomePage.routeName,
        routes: {
          MyHomePage.routeName: (context) => MyHomePage(),
          ExerciseListPage.routeName: (context) => const ExerciseListPage(),
          ExerciseDetailPage.routeName: (context) => ExerciseDetailPage(
                toggleFavourite: _toggleIsFavourite,
              ),
          BmiCalculatorPage.routeName: (context) => const BmiCalculatorPage(),
          FilterPage.routeName: (context) => const FilterPage(),
        });
  }
}
