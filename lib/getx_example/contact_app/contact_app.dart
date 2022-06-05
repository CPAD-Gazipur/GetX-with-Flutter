import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_with_flutter/controller/contact_controller.dart';
import 'package:getx_with_flutter/getx_example/contact_app/add_contact.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/contact.dart';

class ContactApp extends StatelessWidget {
  ContactApp({Key? key}) : super(key: key);

  ContactController contactController =
      Get.put(ContactController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('contact_list'.tr),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemBuilder: (context, index) {
                  Contact contact = contactController.contacts.value[index];
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(contact.name),
                    subtitle: Text(contact.emailAddress),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.call,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        _makePhoneCall('tel:+88${contact.phoneNumber}');
                      },
                    ),
                    onTap: () {
                      Get.bottomSheet(
                        Container(
                          height: 300,
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12),
                              topLeft: Radius.circular(12),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.blue,
                                ),
                                padding: const EdgeInsets.all(8.0),
                                child:  Center(
                                  child: Text(
                                    'contact_details'.tr,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const Divider(),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'name'.tr + contact.name,
                              ),
                              const Divider(),
                              const SizedBox(
                                height: 10,
                              ),
                              Text('email'.tr + contact.emailAddress),
                              const Divider(),
                              const SizedBox(
                                height: 10,
                              ),
                              Text('phone_number'.tr + contact.phoneNumber),
                              const Divider(),
                              const SizedBox(height: 20,),
                              Expanded(
                                child: Center(
                                  child: MaterialButton(
                                    onPressed: () {
                                      contactController.deleteContact(contact);
                                    },
                                    color: Colors.blue,
                                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                                    minWidth: 300,
                                    child:  Text(
                                      'delete_contact'.tr,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            topLeft: Radius.circular(12),
                          ),
                        ),
                      );
                    },
                  );
                },
                itemCount: contactController.contacts.value.length,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              onPressed: () {
                Get.to(() => const AddContact());
              },
              color: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              minWidth: 300,
              child: Text(
                'add_contact'.tr,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
