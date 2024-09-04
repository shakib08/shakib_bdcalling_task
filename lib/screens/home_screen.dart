// lib/screens/home_screen.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../models/android_version.dart';
import '../utils/json_parser.dart';

class HomeScreen extends StatelessWidget {
  final dynamic inputData1 = [
    {
      "0": {"id": 1, "title": "Gingerbread"},
      "1": {"id": 2, "title": "Jellybean"},
      "3": {"id": 3, "title": "KitKat"}
    },
    [
      {"id": 4, "title": "Lollipop"},
      {"id": 5, "title": "Pie"},
      {"id": 6, "title": "Oreo"},
      {"id": 7, "title": "Nougat"}
    ]
  ];

  final dynamic inputData2 = [
    {
      "0": {"id": 1, "title": "Gingerbread"},
      "1": {"id": 2, "title": "Jellybean"},
      "3": {"id": 3, "title": "KitKat"}
    },
    {
      "0": {"id": 8, "title": "Froyo"},
      "2": {"id": 9, "title": "Éclair"},
      "3": {"id": 10, "title": "Donut"}
    },
    [
      {"id": 4, "title": "Lollipop"},
      {"id": 5, "title": "Pie"},
      {"id": 6, "title": "Oreo"},
      {"id": 7, "title": "Nougat"}
    ]
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Android Versions",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: size.width*0.8,
                child: Image.asset('assets/images/bdcalling.png')),
              SizedBox(
                height: size.height * 0.08,
              ),
              Container(
                width: size.width * 0.8,
                child: ElevatedButton(
                  onPressed: () {
                    final versions = parseJson(inputData1);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: versions
                                .map((version) => Text(version.title ?? ''))
                                .toList(),
                          ),
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Set the background color
                    foregroundColor: Colors.white, // Set the text color
                    padding: EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15), // Set padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          12), // Set the button's corner radius
                    ),
                  ),
                  child: Text("Show Output 1"),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                width: size.width * 0.8,
                child: ElevatedButton(
                  onPressed: () {
                    final versions = parseJson(inputData2);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: versions
                                .map((version) => Text(version.title ?? ''))
                                .toList(),
                          ),
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // Set the background color
                    foregroundColor: Colors.white, // Set the text color
                    padding: EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15), // Set padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          12), // Set the button's corner radius
                    ),
                  ),
                  child: Text("Show Output 2"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
