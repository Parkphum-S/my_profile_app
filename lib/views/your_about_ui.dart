import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YourAboutUI extends StatefulWidget {
  const YourAboutUI({Key? key}) : super(key: key);

  @override
  State<YourAboutUI> createState() => _YourAboutUIState();
}

class _YourAboutUIState extends State<YourAboutUI> {
  TextEditingController aboutCtrl = TextEditingController(text: '');
  Future addYourAboutToSF() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    prefer.setString('yourabout', aboutCtrl.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text(
          "Add/Edit About",
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
              'ป้อนรายละเอียด',
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
                controller: aboutCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ป้อนรายละเอียดของคุณ',
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
                if (aboutCtrl.text.trim().length == 0) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'คำเตือน',
                        ),
                        content: Text(
                          'ป้อนรายละเอียดของคุณด้วย',
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
                  addYourAboutToSF().then((value) {
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
