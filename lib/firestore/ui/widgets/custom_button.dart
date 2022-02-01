import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  Function function;
  String title;
  CustomButton({this.function, this.title});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Text(
          this.title,
          style: TextStyle(color: Colors.white),
        ),
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
