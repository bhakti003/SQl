import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqllite_demo/Controller/home_screen_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final addressController = TextEditingController();
  var homeScreenController = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
            ),
            TextFormField(
              controller: ageController,
            ),
            TextFormField(
              controller: addressController,
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                homeScreenController.addData(
                    name: nameController.text,
                    age: ageController.text,
                    address: addressController.text);
                print("Done");
              },
              child: Container(
                height: 40,
                width: 80,
                color: Colors.lightBlueAccent,
                child: Center(child: Text("Save")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
