import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_with_flutter/getx_example/dummy_api_app/user_list.dart';

class DummyApi extends StatefulWidget {
  const DummyApi({Key? key}) : super(key: key);

  @override
  State<DummyApi> createState() => _DummyApiState();
}

class _DummyApiState extends State<DummyApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dummy_api'.tr),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: MaterialButton(
                onPressed: () {
                  Get.to(() => const UserLists());
                },
                color: Colors.blue,
                child: Text(
                  'fetch_data'.tr,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
