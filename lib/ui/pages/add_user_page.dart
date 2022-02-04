import 'package:flutter/material.dart';
import 'package:kotuko_coding_challange/core/service/airline_api.dart';
import 'package:kotuko_coding_challange/utils/constants.dart';
import 'package:kotuko_coding_challange/utils/screen_size.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  bool isLoading = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController tripController = TextEditingController();
  TextEditingController airlineController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: ScreenSize.getHeight(context) * 0.2,
              horizontal: ScreenSize.getWidth(context) * 0.05),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
                decoration: kTextFieldInputDecoration(
                  suffixIcon: Icons.person_outline,
                  hintText: "name",
                ),
              ),
              SizedBox(
                height: ScreenSize.getHeight(context) * 0.02,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: tripController,
                decoration: kTextFieldInputDecoration(
                  suffixIcon: Icons.airplane_ticket_sharp,
                  hintText: "Trips",
                ),
              ),
              SizedBox(
                height: ScreenSize.getHeight(context) * 0.02,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: airlineController,
                decoration: kTextFieldInputDecoration(
                  suffixIcon: Icons.flight_takeoff_outlined,
                  hintText: "Airline code",
                ),
              ),
              SizedBox(
                height: ScreenSize.getHeight(context) * 0.1,
              ),
              InkWell(
                onTap: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  setState(() {
                    isLoading = true;
                  });
                  if (nameController.text.isNotEmpty &&
                      tripController.text.isNotEmpty &&
                      airlineController.text.isNotEmpty) {
                    final response = await AirlineApi.createPassenger(
                            nameController.text,
                            tripController.text,
                            airlineController.text)
                        .whenComplete(() {
                      nameController.text = "";
                      tripController.text = "";
                      airlineController.text = "";
                      setState(() {
                        isLoading = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.blue.shade400,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          behavior: SnackBarBehavior.floating,
                          content: ListTile(
                            leading: Icon(
                              Icons.done,
                              size: 30,
                              color: Colors.yellow,
                            ),
                            title: Text(
                              "User Added Succesfully",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow,
                              ),
                            ),
                          ),
                        ),
                      );
                    });
                  } else {
                    setState(() {
                      isLoading = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.blue.shade400,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        behavior: SnackBarBehavior.floating,
                        content: ListTile(
                          leading: Icon(
                            Icons.warning,
                            color: Colors.yellow,
                          ),
                          title: Text(
                            "Please enter all fields ",
                            style: TextStyle(
                              color: Colors.yellow,
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue.shade400,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 3,
                            blurRadius: 1)
                      ]),
                  height: ScreenSize.getHeight(context) * 0.1,
                  width: ScreenSize.getWidth(context) * 0.5,
                  child: Center(
                    child: isLoading
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            "Submit",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
