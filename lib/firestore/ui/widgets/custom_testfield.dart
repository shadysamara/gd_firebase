import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  String label;
  TextEditingController controller;
  TextInputType textInputType;
  CustomTextfield(
      {this.label, this.controller, this.textInputType = TextInputType.text});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: this.controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
            label: Text(this.label),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
