import 'package:flutter/material.dart';
import 'package:gym_guide_app/data/exercise.dart';
import 'package:gym_guide_app/model/exercise_model.dart';
import 'package:gym_guide_app/pages/bmi_calculator_page.dart';
import 'package:gym_guide_app/pages/exercise_detail_page.dart';
import 'package:gym_guide_app/pages/exercise_list_page.dart';
import 'package:gym_guide_app/pages/filter_page.dart';
import 'package:gym_guide_app/pages/my_home_page.dart';
import 'package:gym_guide_app/video/video_size.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

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
      title: 'Flutter Demo',
      theme: ThemeData(
        sliderTheme: const SliderThemeData(
            activeTrackColor: Color(0xFF322751),
            activeTickMarkColor: Color(0xFF322751),
            thumbColor: Color(0xFF322751)),
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            labelStyle: const TextStyle(
              color: Color(0xFF322751),
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF322751)))),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Color(0xFF322751),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF322751),
        ),
        primarySwatch: Colors.blue,
      ),
      initialRoute: MyHomePage.routeName,
      routes: {
        MyHomePage.routeName: (context) => MyHomePage(),
        ExerciseListPage.routeName: (context) => const ExerciseListPage(),
        ExerciseDetailPage.routeName: (context) =>
            ExerciseDetailPage(toggleFavourite: _toggleIsFavourite),
        BMICalculatorPage.routeName: (context) => const BMICalculatorPage(),
        FilterPage.routeName: (context) => const FilterPage(),
        VideoPlayersScreen.routeName: (context) => VideoPlayersScreen()
      },
    );
  }
}

/*

keytool -genkey -v -keystore Users\User\upload-keystore.jks
        -storetype JKS -keyalg RSA -keysize 2048 -validity 10000
        -alias upload
        keytool -keystore C:\Users\hp\.android\debug.keystore -list -v

*/
