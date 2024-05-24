import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MyDropdownButton.dart';

class Exchaning_Process extends StatelessWidget {
  const Exchaning_Process({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 120,
          height: 50,
          child:MyDropdownButton(),
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Icon(Icons.currency_exchange_outlined),

        ), Container(
          width: 120,
          height: 50,
          child:MyDropdownButton(),

        ),
      ],
    );
  }
}