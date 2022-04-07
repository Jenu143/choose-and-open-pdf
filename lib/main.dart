import 'dart:io';

import 'package:choose_pdf/simple_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PlatformFile? file;
  File? imgFile;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () async {
                    final result = await FilePicker.platform.pickFiles();
                    file = result?.files.first;
                    imgFile = File("${file?.path ?? ""}");
                    setState(() {});
                    print("object : $imgFile");

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SimpleView(imgFile: imgFile!),
                      ),
                    );
                  },
                  child: const Text(
                    'Open File',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Text(
                  "Path : ${imgFile}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
