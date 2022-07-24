import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YourPhoneUI extends StatefulWidget {
  const YourPhoneUI({Key? key}) : super(key: key);

  @override
  State<YourPhoneUI> createState() => _YourPhoneUIState();
}

class _YourPhoneUIState extends State<YourPhoneUI> {
  TextEditingController phoneCtrl = TextEditingController(text: '');
  Future addYourPhonToSF() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    prefer.setString('yourphone', phoneCtrl.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text(
          "Add/Edit Phone",
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50.0,
            ),
            Text(
              'ป้อนเบอร์โทร',
              style: GoogleFonts.itim(
                fontSize: 35.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50.0,
                right: 50.0,
              ),
              child: TextField(
                controller: phoneCtrl,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ป้อนเบอร์โทรของคุณ',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                if (phoneCtrl.text.trim().length == 0) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'คำเตือน',
                        ),
                        content: Text(
                          'ป้อนเบอร์โทรของคุณด้วย',
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop;
                            },
                            child: Text(
                              'ตกลง',
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                            ),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  addYourPhonToSF().then((value) {
                    Navigator.pop(context);
                  });
                }
              },
              child: Text(
                'บันทึก',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(
                  MediaQuery.of(context).size.width * 0.7,
                  50,
                ),
                primary: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
