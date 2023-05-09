import 'package:flutter/material.dart';
import 'package:gym_guide_application/pages/filter_page.dart';
import 'package:gym_guide_application/shared_prefs.dart';

class AppState {
  static Equipment selectedEquipment = Equipment.both;
  static double difficultyLevel = 5;
  static SharedPrefs sharedPrefs = SharedPrefs();
}
