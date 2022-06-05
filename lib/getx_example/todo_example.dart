import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_with_flutter/model/item.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<Item> itemList = [];
  List<Item> itemDoneList = [];

  TextEditingController itemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('todo_app'.tr),
      ),
      body: ListView.builder(
        itemCount: itemList.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              'task'.tr + (index+1).toString(),
              style: TextStyle(
                decoration:
                    itemList[index].isDone! ? TextDecoration.lineThrough : null,
              ),
            ),
            subtitle: Text(
              itemList[index].itemName!,
              style: TextStyle(
                decoration:
                    itemList[index].isDone! ? TextDecoration.lineThrough : null,
              ),
            ),
            leading: Icon(
              Icons.check_box,
              color: itemList[index].isDone! ? Colors.blue : Colors.grey,
            ),
            trailing: IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                Get.defaultDialog(
                  title: 'delete_item'.tr,
                  content: Text(itemList[index].itemName!),
                  confirm: ElevatedButton(
                    onPressed: () {
                      itemList.removeAt(index);
                      Get.back();
                      setState(() {});
                    },
                    child: Text('yes'.tr),
                  ),
                  cancel: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('no'.tr),
                  ),
                );
              },
            ),
            onTap: () {
              setState(() {
                itemList[index].isDone = !itemList[index].isDone!;
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'todoList',
        child: const Icon(Icons.list),
        onPressed: () {
          Get.bottomSheet(
            Container(
              height: 180,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'item_name'.tr,
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(),
                    ),
                    controller: itemController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    onPressed: () {
                      if (itemController.text.isEmpty) {
                        Get.snackbar('waring'.tr, 'item_required'.tr,
                            colorText: Colors.white,
                            backgroundColor: Colors.black54);
                        return;
                      }
                      itemList.add(
                          Item(itemName: itemController.text, isDone: false));
                      itemController.clear();
                      Get.back();

                      setState(() {});
                    },
                    color: Colors.blue,
                    child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'add_item'.tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
