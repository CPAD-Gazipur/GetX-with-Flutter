import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_with_flutter/model/model.dart';

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
        title: const Text('Todo App'),
      ),
      body: ListView.builder(
        itemCount: itemList.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              'Task: ${index + 1}',
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
                  title: 'Are you sure to delete item ?',
                  content: Text(itemList[index].itemName!),
                  confirm: ElevatedButton(
                    onPressed: () {
                      itemList.removeAt(index);
                      Get.back();
                      setState(() {});
                    },
                    child: const Text('Yes'),
                  ),
                  cancel: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('No'),
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
                    decoration: const InputDecoration(
                      hintText: 'Item name',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                    ),
                    controller: itemController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    onPressed: () {
                      if (itemController.text.isEmpty) {
                        Get.snackbar('Warning', 'Item name required !',
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
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'ADD ITEM',
                        style: TextStyle(
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
