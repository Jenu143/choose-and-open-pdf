import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SimpleView extends StatefulWidget {
  const SimpleView({Key? key, required this.imgFile}) : super(key: key);
  final File imgFile;

  @override
  State<SimpleView> createState() => _SimpleViewState();
}

class _SimpleViewState extends State<SimpleView> {
  @override
  void initState() {
    super.initState();

    setState(() {
      widget.imgFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SfPdfViewer.file(widget.imgFile),
      ),
    );
  }
}
