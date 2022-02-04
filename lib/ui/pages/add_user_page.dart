import 'package:flutter/material.dart';
import 'package:kotuko_coding_challange/utils/constants.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  TextEditingController nameController = TextEditingController();
  TextEditingController tripController = TextEditingController();
  TextEditingController airlineController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actionsIconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          "Add User",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 24),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: nameController,
            decoration: kTextFieldInputDecoration(
                suffixIcon: Icons.person,
                hintText: "name",
                errorText: "Not a valid name"),
          ),
          TextField(
            controller: tripController,
            decoration: kTextFieldInputDecoration(
                hintText: "Trips", errorText: "Invalid trips"),
          ),
          TextField(
            controller: airlineController,
            decoration: kTextFieldInputDecoration(
                hintText: "Airline code", errorText: "Invalid airline"),
          )
        ],
      ),
    );
  }
}
