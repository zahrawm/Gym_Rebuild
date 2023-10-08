import 'package:flutter/material.dart';
import 'package:gym_guide_app/data/exercise.dart';
import 'package:gym_guide_app/data/workout_category_list.dart';
import 'package:gym_guide_app/pages/bmi_calculator_page.dart';
import 'package:gym_guide_app/pages/filter_page.dart';
import 'package:gym_guide_app/widgets/exericse_card_widget.dart';
import 'package:gym_guide_app/widgets/workout_category_widget.dart';

class MyHomePage extends StatefulWidget {
  static String routeName = "/myHomePage";
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
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
                  " GYM GUIDE",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
            ),
            ListTile(
              title: const Text("BMI Calculator"),
              onTap: () {
                Navigator.of(context).pushNamed(BMICalculatorPage.routeName);
              },
            ),
            const Divider(),
            ListTile(
              title: const Text("Filter"),
              onTap: () {
                Navigator.of(context).pushNamed(FilterPage.routeName);
              },
            )
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
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            label: "Favorite",
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text(
          "Welcome",
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
                  ))
                : exerciseList
                        .where((element) => element.isFavourite)
                        .toList()
                        .isEmpty
                    ? const SizedBox(
                        height: 500,
                        child: Center(
                          child: Text(
                            "No  exercise marked as favourite",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
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
                              exerciseModel: exerciseList
                                  .where((element) => element.isFavourite)
                                  .toList()[index]),
                          itemCount: exerciseList
                              .where((element) => element.isFavourite)
                              .toList()
                              .length,
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
