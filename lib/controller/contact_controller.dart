import 'package:get/get.dart';
import 'package:getx_with_flutter/model/contact.dart';

class ContactController extends GetxController {

  var contacts = [].obs;

  void addContact(Contact contact){
    contacts.add(contact);
    Get.back();
  }


  void deleteContact(Contact contact){
    contacts.remove(contact);
    Get.back();
  }
}