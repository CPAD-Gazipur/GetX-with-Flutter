import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_with_flutter/getx_example/contact_app/contact_app.dart';
import 'package:getx_with_flutter/getx_example/dummy_api_app/dummy_api.dart';
import 'package:getx_with_flutter/getx_example/obx_example.dart';
import 'package:getx_with_flutter/getx_example/todo_example.dart';
import 'package:getx_with_flutter/getx_utils/getx_utils.dart';
import 'package:getx_with_flutter/utils/app_scroll_behaviour.dart';
import 'package:getx_with_flutter/utils/localization_page.dart';
import 'ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: AppScrollBehavior(),
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallBackLocale,
      translations: LocalizationService(),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/utilsImplementation', page: () => const GetXUtilsImplementation()),
        GetPage(name: '/obxExample', page: () => ObxExample()),
        GetPage(name: '/todoApp', page: () => const TodoApp()),
        GetPage(name: '/contactApp', page: () => ContactApp()),
        GetPage(name: '/dummyApiApp', page: () => const DummyApi()),
      ],
    );
  }
}


