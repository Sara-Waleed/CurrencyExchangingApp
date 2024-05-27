import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultContainer extends StatelessWidget {

  final String text;
  const ResultContainer({
    super.key,
    required this.text
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadiusDirectional.circular(20),
      ),
      width: double.infinity,
      height: 150,
      child: Center(child: Text(text)),);
  }
}