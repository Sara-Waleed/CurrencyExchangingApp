import 'package:flutter/material.dart';
class MainAppBar extends StatelessWidget {
  MainAppBar({
    super.key,
    required this.title,
  });
  String title;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.loop,color: Colors.black,),
        SizedBox(width: 5,),
        Text(
          "$title",
          style: TextStyle(
              color: Colors.black,
              fontWeight:FontWeight.bold,
              fontSize: 25
          ),
        ),
      ],
    );

  }
}