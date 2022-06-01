import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
              Get.to(const GetXUtilsImplementation());
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.people,
              color: Colors.grey,
            ),
            title: const Text('Example'),
            onTap: () {
              Get.to(() => const TodoApp());
            },
          ),
        ],
      ),
    );
  }
}
