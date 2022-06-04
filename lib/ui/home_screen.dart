import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_with_flutter/getx_example/obx_example.dart';
import 'package:getx_with_flutter/getx_example/todo_example.dart';
import 'package:getx_with_flutter/getx_utils/getx_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX with Flutter'),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(
              Icons.people,
              color: Colors.grey,
            ),

            title: const Text('GetX Utils'),
            onTap: () {
              // Manual Page Routing
              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const GetXUtilsImplementation()));

              // GetX Page Routing
              //Get.to(const GetXUtilsImplementation());

              // GetX named Routing
              Get.toNamed('/utilsImplementation');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.people,
              color: Colors.grey,
            ),
            title: const Text('Obx Example'),
            onTap: () {
              // GetX Page Routing with Animation
              //Get.to(() => ObxExample(),curve: Curves.ease,duration: const Duration(milliseconds: 1000));

              //// GetX named Routing
              Get.toNamed('/obxExample');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.people,
              color: Colors.grey,
            ),
            title: const Text('Todo App'),
            onTap: () {
              // GetX Page Routing
              //Get.to(() => const TodoApp());

              // GetX named Routing
              Get.toNamed('/todoApp');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.people,
              color: Colors.grey,
            ),
            title: const Text('Contact App'),
            onTap: () {
              // GetX Page Routing
              //Get.to(() => const TodoApp());

              // GetX named Routing
              Get.toNamed('/contactApp');
            },
          ),

        ],
      ),
    );
  }
}
