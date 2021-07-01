import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var webdata;
  myweb(cmd) async {
    var url = Uri.parse("http://192.168.56.101/cgi-bin/a.py?x=${cmd}");
    var r = await http.get(url);
    setState(() {
      webdata = r.body;
    });
  }

  TextEditingController cmdentrdcontroller = new TextEditingController();
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text(
            'DockerX',
            style: TextStyle(fontSize: 27, color: Colors.orange),
            textAlign: TextAlign.right,
          ),
        ),
        body: Column(children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: new Theme(
                data: new ThemeData(
                  primaryColor: Colors.orange,
                  primaryColorDark: Colors.orange,
                ),
                child: TextField(
                  controller: cmdentrdcontroller,
                  autofocus: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your cmd',
                  ),
                  style: TextStyle(fontSize: 26, color: Colors.orange),
                ),
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: ElevatedButton(
              child: Text(
                'execute',
                style: TextStyle(fontSize: 26, color: Colors.orange),
              ),
              onPressed: () {
                //print(cmdentrdcontroller.text);
                myweb(cmdentrdcontroller.text);
              },
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          Flexible(
            child: Text(
              '$webdata',
              style: TextStyle(fontSize: 18, color: Colors.orange),
            ),
          ),
          // ),
        ]),
      ),
    );
  }
}
