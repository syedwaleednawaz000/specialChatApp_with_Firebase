import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
   MyTextField({required this.controller,required this.hintText,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.blue.withOpacity(0.5))
      ),
      child: TextFormField(
        controller: controller,
        maxLines: null,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          filled: true,
          fillColor:  Colors.transparent,
          // hintMaxLines: null,
          
        ),
      ),
    );
  }
}
