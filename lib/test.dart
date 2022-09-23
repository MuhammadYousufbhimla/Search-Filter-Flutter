import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key, this.title, this.subtitlee}) : super(key: key);

  final title;
  final subtitlee;
  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Details"),
      ),
      body: Center(
        child: ListView(
          children: [
            ExpansionTile(title: Text(widget.title), children: [
              Text(widget.subtitlee),
            ]),
            Text(widget.title),
            Text(widget.subtitlee),
          ],
        ),
      ),
    );
  }
}
