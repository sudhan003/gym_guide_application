import 'package:flutter/material.dart';
import 'package:gym_guide_application/app_state_page.dart';

enum Equipment { noEquipment, equipment, both }

class FilterPage extends StatefulWidget {
  static String routeName = "/filterPage";

  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const ListTile(
            leading: Icon(
              Icons.fitness_center,
              color: Color(0xFF311B92),
            ),
            title: Text(
              "Equipment",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          RadioListTile(
            activeColor: const Color(0xFF311B92),
            title: const Text(
              'No Equipment',
            ),
            value: Equipment.noEquipment,
            groupValue: AppState.selectedEquipment,
            onChanged: (value) {
              AppState.selectedEquipment = value!;
              setState(() {});
            },
          ),
          RadioListTile(
            activeColor: const Color(0xFF311B92),
            title: const Text(
              'Equipment',
            ),
            value: Equipment.equipment,
            groupValue: AppState.selectedEquipment,
            onChanged: (value) {
              AppState.selectedEquipment = value!;
              setState(() {});
            },
          ),
          RadioListTile(
            activeColor: const Color(0xFF311B92),
            title: const Text(
              'Both',
            ),
            value: Equipment.both,
            groupValue: AppState.selectedEquipment,
            onChanged: (value) {
              AppState.selectedEquipment = value!;
              setState(() {});
            },
          ),
          const Divider(),
          const ListTile(
            title: Text('Difficulty level'),
            leading: Icon(
              Icons.work_history,
              color: Color(0xFF311B92),
            ),
          ),
          Slider(
            value: AppState.difficultyLevel,
            onChanged: (value) {
              AppState.difficultyLevel = value;
              setState(() {});
            },
            label: "Difficulty level: ${AppState.difficultyLevel}",
            min: 1,
            max: 5,
            activeColor: const Color(0xFF311B92),
            thumbColor: const Color(0xFF311B92),
            divisions: 4,
          ),
        ],
      ),
    );
  }
}
