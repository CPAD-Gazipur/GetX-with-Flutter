import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetXUtilsImplementation extends StatelessWidget {
  const GetXUtilsImplementation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('utility_title'.tr),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('get_x_snack_bar'.tr),
            onTap: () {
              Get.snackbar('success'.tr, 'snack_bar'.tr,
                  colorText: Colors.white, backgroundColor: Colors.black26);
            },
          ),
          ListTile(
            title: Text('get_x_dialog'.tr),
            onTap: () {
              Get.defaultDialog(
                title: 'get_x_dialog'.tr,
                content: Column(
                  children: [
                    Text('flutter_get_x_dialog'.tr),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('done'.tr),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: Text('get_x_bottom_sheet'.tr),
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
                      Text('flutter_get_x_dialog'.tr),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text('close'.tr),
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
