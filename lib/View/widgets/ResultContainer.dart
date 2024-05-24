import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultContainer extends StatelessWidget {

  final String text="Result";
  const ResultContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadiusDirectional.circular(20),
      ),
      width: double.infinity,
      height: 200,


      child: Center(child: Text(text)),);
  }
}