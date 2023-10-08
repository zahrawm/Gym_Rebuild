import 'package:flutter/material.dart';
import 'package:gym_guide_app/app_state.dart';

enum Equipment { noEquipment, equipment, both }

class FilterPage extends StatefulWidget {
  static String routeName = "/filterPage";
  const FilterPage({
    Key? key,
  }) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter"),
      ),
      body: Column(children: [
        const ListTile(
          title: Text("Equipment"),
          leading: Icon(
            Icons.fitness_center,
            color: Color(0xFF322751),
          ),
        ),
        RadioListTile(
            activeColor: const Color(0xFF322751),
            title: const Text("No Equipment"),
            value: Equipment.noEquipment,
            groupValue: AppState.selectedEquipment,
            onChanged: (value) {
              AppState.selectedEquipment = value!;
              setState(() {});
            }),
        RadioListTile(
            activeColor: const Color(0xFF322751),
            title: const Text("Equipment"),
            value: Equipment.equipment,
            groupValue: AppState.selectedEquipment,
            onChanged: (value) {
              AppState.selectedEquipment = value!;
              setState(() {});
            }),
        RadioListTile(
            activeColor: const Color(0xFF322751),
            title: const Text("Equipment"),
            value: Equipment.both,
            groupValue: AppState.selectedEquipment,
            onChanged: (value) {
              AppState.selectedEquipment = value!;
              setState(() {});
            }),
        const ListTile(
          title: Text("Diffcuilty Level"),
          leading: Icon(
            Icons.work_history,
            color: Color(0xFF322751),
          ),
        ),
        Slider(
            divisions: 4,
            onChanged: (value) {
              AppState.difficuiltyLevel = value;
              setState(() {});
            },
            label: "Difficulty Level : ${AppState.difficuiltyLevel}",
            value: AppState.difficuiltyLevel,
            max: 5,
            min: 1)
      ]),
    );
  }
}
