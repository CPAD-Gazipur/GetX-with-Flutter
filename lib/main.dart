import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_with_flutter/getx_example/contact_app/contact_app.dart';
import 'package:getx_with_flutter/getx_example/obx_example.dart';
import 'package:getx_with_flutter/getx_example/todo_example.dart';
import 'package:getx_with_flutter/getx_utils/getx_utils.dart';
import 'ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/utilsImplementation', page: () => const GetXUtilsImplementation()),
        GetPage(name: '/obxExample', page: () => ObxExample()),
        GetPage(name: '/todoApp', page: () => const TodoApp()),
        GetPage(name: '/contactApp', page: () => ContactApp()),
      ],
    );
  }
}


