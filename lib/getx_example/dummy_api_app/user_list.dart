import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_with_flutter/controller/user_controller.dart';

class UserLists extends StatefulWidget {
  const UserLists({Key? key}) : super(key: key);

  @override
  State<UserLists> createState() => _UserListsState();
}

class _UserListsState extends State<UserLists> {
  UserController userController = Get.put(UserController());

  @override
  void initState() {
    super.initState();
    userController.getUserInfoFromAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('user_list'.tr),
      ),
      body: Obx(
        () => userController.isDataLoading.value
            ? const Center(child: CircularProgressIndicator.adaptive())
            : ListView.builder(
                itemCount: userController.userList!.data!.length,
                itemBuilder: (context, index) {
                  String? image = '';
                  String? name = '';
                  String? subTitle = '';
                  String? uID = '';

                  try {
                    image = userController.userList!.data![index]?.picture!;
                    name = userController.userList!.data![index]?.firstName!;
                    subTitle = userController.userList!.data![index]?.lastName!;
                    uID = userController.userList!.data![index]?.id!;
                  } catch (e) {
                    image = '';
                    name = '';
                    subTitle = '';
                    uID = '';
                    debugPrint('Error: $e');
                  }

                  return ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(image!),
                    ),
                    title: Text('$name $subTitle'),
                    subtitle: Text(uID!),
                  );
                },
              ),
      ),
    );
  }
}
