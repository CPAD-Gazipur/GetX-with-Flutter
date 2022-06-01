import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetXUtilsImplementation extends StatelessWidget {
  const GetXUtilsImplementation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Utility Functions of GetX'),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Snackbar in GetX'),
            onTap: () {
              Get.snackbar('Success', 'Wow, Snackbar working...',
                  colorText: Colors.white, backgroundColor: Colors.black26);
            },
          ),
          ListTile(
            title: const Text('Dialog in GetX'),
            onTap: () {
              Get.defaultDialog(
                title: 'Dialog in GetX',
                content: Column(
                  children: [
                    const Text('Flutter Dialog in GetX'),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('Done'),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: const Text('BottomSheet in GetX'),
            onTap: () {
              Get.bottomSheet(
                enterBottomSheetDuration: const Duration(milliseconds: 700),
                exitBottomSheetDuration: const Duration(milliseconds: 700),
                enableDrag: true,
                ignoreSafeArea: false,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                backgroundColor: Colors.white70,
                SizedBox(
                  height: 150,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text('Flutter Dialog in GetX'),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
