import 'package:ask_soul/question_views.dart';
import 'package:ask_soul/questions.dart';
import 'package:flutter/material.dart';

class SoulView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(30),
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                QuestionPage(Questions.buyQuestionMap)));
                  },
                  child: const Text("Buy")),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(30),
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                QuestionPage(Questions.saleQuestionMap)));
                  },
                  child: const Text("Sale")),
            ),
          )
        ],
      ),
    );
  }
}
