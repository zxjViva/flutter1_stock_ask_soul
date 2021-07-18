import 'dart:math';

import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {
  final Map<String, bool> question;

  const QuestionPage(this.question);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: QuestionView(widget.question),
    );
  }
}

class QuestionView extends StatefulWidget {
  late Map<String, bool> question;

  QuestionView(this.question, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _QuestionView(question);
  }
}

class _QuestionView extends State<QuestionView> {
  var index = 0;
  late Map<String, bool> question;
  var anwsers = <bool>[];
  var allAnwsersIsRight = false;

  _QuestionView(Map<String, bool> question) {
    this.question = question;
  }

  @override
  Widget build(BuildContext context) {
    if (index >= question.length) {
      return Material(
        child: Center(
          child: Text(
            allAnwsersIsRight ? "可以操作" : "不能操作",
            textScaleFactor: 3.0,
            style:
                TextStyle(color: allAnwsersIsRight ? Colors.red : Colors.green),
          ),
        ),
      );
    } else {
      return Material(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              padding: EdgeInsets.only(bottom: 50),
              child: Text(
                this.question.keys.elementAt(index),
                textScaleFactor: 3.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  color: Colors.red,
                  padding: EdgeInsets.all(50),
                  onPressed: () {
                    toNextQuestion(true);
                  },
                  child: const Text(
                    "Yes",
                    textScaleFactor: 2.0,
                  ),
                ),
                MaterialButton(
                  color: Colors.red,
                  padding: EdgeInsets.all(50),
                  onPressed: () {
                    toNextQuestion(false);
                  },
                  child: const Text(
                    "No",
                    textScaleFactor: 2.0,
                  ),
                )
              ],
            )
          ]),
        ),
      );
    }
  }

  void toNextQuestion(bool answer) {
    anwsers.add(answer);
    if (anwsers.length == question.length) {
      var list = question.values.toList();
      for (int i = 0; i < list.length; i++) {
        if (anwsers[i] != list[i]) {
          break;
        }
        if (i == list.length - 1) {
          allAnwsersIsRight = true;
        }
      }
    }
    setState(() {
      index++;
    });
  }
}
