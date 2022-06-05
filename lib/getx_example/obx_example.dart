import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ObxExample extends StatelessWidget {
  ObxExample({Key? key}) : super(key: key);

  var value = 0.obs;

  void increment() {
    value++;
  }

  void decrement() {
    value--;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('obx_example'.tr),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                'number'.tr + value.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  heroTag: 'increment',
                  onPressed: () {
                    decrement();
                  },
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  heroTag: 'decrement',
                  onPressed: () {
                    increment();
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
