import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/localization_page.dart';
import '../utils/app_credentials.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isEnglish = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'.tr),
        actions: [
          Center(
            child: Text(
              'BN',
              style: TextStyle(
                fontWeight: isEnglish ? FontWeight.normal : FontWeight.bold,
                color: isEnglish ? Colors.white60 : Colors.white,
              ),
            ),
          ),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: Colors.white70,
              trackColor: Colors.black26,
              thumbColor: Colors.white,
              value: isEnglish,
              onChanged: (value) {
                setState(() {
                  isEnglish = value;
                  if(isEnglish){
                    LocalizationService().changeLocale(englishLanguage);
                  }
                  else{
                    LocalizationService().changeLocale(bengaliLanguage);
                  }
                });
              },
            ),
          ),
          Center(
              child: Text(
            'EN',
            style: TextStyle(
              fontWeight: isEnglish? FontWeight.bold : FontWeight.normal,
              color: isEnglish ? Colors.white : Colors.white60,
            ),
          )),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(
              Icons.people,
              color: Colors.grey,
            ),
            title: Text('get_x_utils'.tr),
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
            title: Text('obx_example'.tr),
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
            title: Text('todo_app'.tr),
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
            title: Text('contact_app'.tr),
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
