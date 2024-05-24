import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencyValueField extends StatelessWidget {
  const CurrencyValueField({
    super.key,
    required this.controllerr,
  });

  final TextEditingController controllerr;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        controllerr.text = value; // Update the controller's text
      },
      onSaved: (newValue) {
        controllerr.text = newValue ?? ''; // Ensure newValue is not null
      },
      controller: controllerr,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "input valid value",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}