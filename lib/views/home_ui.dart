import 'package:flutter/material.dart';
import 'package:my_profile_app/views/your_about_ui.dart';
import 'package:my_profile_app/views/your_email_ui.dart';
import 'package:my_profile_app/views/your_name_ui.dart';
import 'package:my_profile_app/views/your_phone_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({Key? key}) : super(key: key);

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
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
                  Container(
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
