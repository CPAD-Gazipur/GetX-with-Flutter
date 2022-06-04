import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_with_flutter/controller/contact_controller.dart';
import 'package:getx_with_flutter/model/contact.dart';

class AddContact extends StatefulWidget {
  const AddContact({Key? key}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  ContactController contactController = Get.find<ContactController>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Contact'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Name',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Phone number is required';
                  } else if (value.length > 11 || value.length < 11) {
                    return 'Phone number must be 11 digit';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Phone number',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email is required';
                  } else if (!value.contains('@')) {
                    return 'Please use valid email';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email address',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  if (!formKey.currentState!.validate()) {

                    return;

                  } else {
                    Contact contact = Contact(
                      name: nameController.text,
                      phoneNumber: phoneNumberController.text,
                      emailAddress: emailController.text,
                    );

                    contactController.addContact(contact);
                  }
                },
                color: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                minWidth: 300,
                child: const Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
