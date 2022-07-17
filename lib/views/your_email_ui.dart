import 'package:flutter/material.dart';

class YourEmailUI extends StatefulWidget {
  const YourEmailUI({Key? key}) : super(key: key);

  @override
  State<YourEmailUI> createState() => _YourEmailUIState();
}

class _YourEmailUIState extends State<YourEmailUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text(
          "Add/Edit Email",
        ),
        centerTitle: true,
      ),
    );
  }
}
