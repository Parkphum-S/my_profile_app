// ignore_for_file: unused_local_variable, unused_import, unused_field
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_profile_app/views/your_about_ui.dart';
import 'package:my_profile_app/views/your_email_ui.dart';
import 'package:my_profile_app/views/your_name_ui.dart';
import 'package:my_profile_app/views/your_phone_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({Key? key}) : super(key: key);

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  TextEditingController yournameCtrl = TextEditingController(text: '');
  TextEditingController yourphoneCtrl = TextEditingController(text: '');
  TextEditingController youremailCtrl = TextEditingController(text: '');
  TextEditingController youraboutCtrl = TextEditingController(text: '');

  File? _image;

  getImageFromCameraAndSaveToSF() async {
    XFile? pickImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickImage != null) {
      setState(() {
        _image = File(pickImage.path);
      });
    }
  }

  getImageFromGalleryAndSaveToSF() async {
    XFile? pickImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickImage != null) {
      setState(() {
        _image = File(pickImage.path);
      });
    }
  }

  check_and_show_data() async {
    SharedPreferences prefe = await SharedPreferences.getInstance();
    bool yournameKey = prefe.containsKey('yourname');
    bool yourphoneKey = prefe.containsKey('yourphone');
    bool youremailKey = prefe.containsKey('youremail');
    bool youraboutKey = prefe.containsKey('yourabout');

    if (yournameKey == true) {
      setState(() {
        yournameCtrl.text = prefe.getString('yourname')!;
      });
    }
    if (yourphoneKey == true) {
      setState(() {
        yourphoneCtrl.text = prefe.getString('yourphone')!;
      });
    }
    if (youremailKey == true) {
      setState(() {
        youremailCtrl.text = prefe.getString('youremail')!;
      });
    }
    if (youraboutKey == true) {
      setState(() {
        youraboutCtrl.text = prefe.getString('yourabout')!;
      });
    }
  }

  @override
  void initState() {
    check_and_show_data();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text(
          "My Profile",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _image == null
                      ? Container(
                          height: MediaQuery.of(context).size.width * 0.5,
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/myprofile.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Container(
                          height: MediaQuery.of(context).size.width * 0.5,
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/myprofile.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.camera_alt_rounded,
                      size: MediaQuery.of(context).size.width * 0.08,
                      color: Colors.green[800],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 35.0,
                  right: 35.0,
                ),
                child: TextField(
                  controller: yournameCtrl,
                  readOnly: true,
                  decoration: InputDecoration(
                    label: Text(
                      'Your Name :',
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Your Name',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => YourNameUI()),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.edit,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 35.0,
                  right: 35.0,
                ),
                child: TextField(
                  controller: yourphoneCtrl,
                  readOnly: true,
                  decoration: InputDecoration(
                    label: Text(
                      'Your Phone :',
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Your Phone',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => YourPhoneUI()),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.edit,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 35.0,
                  right: 35.0,
                ),
                child: TextField(
                  controller: youremailCtrl,
                  readOnly: true,
                  decoration: InputDecoration(
                    label: Text(
                      'Your Email :',
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Your Email',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => YourEmailUI()),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.edit,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 35.0,
                  right: 35.0,
                ),
                child: TextField(
                  controller: youraboutCtrl,
                  readOnly: true,
                  decoration: InputDecoration(
                    label: Text(
                      'Your About :',
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Your About',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => YourAboutUI()),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.edit,
                      ),
                    ),
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
