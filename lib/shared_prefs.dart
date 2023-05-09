import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static final SharedPrefs _instance = SharedPrefs._internal();

  factory SharedPrefs() => _instance;

  SharedPreferences? _sharedPreferences;

  SharedPrefs._internal() {
    init();
  }

  init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  addExerciseIdToList(String name) async {
    List<String> myList =
        _sharedPreferences!.getStringList('favourite_exercise') ?? [];
    if (!myList.contains(name)) {
      myList.add(name);
      await _sharedPreferences!.setStringList('favourite_exercise', myList);
      print(getFavouriteExerciseId());
    } else {
      myList.remove(name);
      await _sharedPreferences!.setStringList('favourite_exercise', myList);
      print(getFavouriteExerciseId());
    }
  }

  List<String> getFavouriteExerciseId() {
    return _sharedPreferences == null
        ? []
        : _sharedPreferences!.getStringList('favourite_exercise') ?? [];
  }
}
