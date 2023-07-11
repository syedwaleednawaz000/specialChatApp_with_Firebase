import 'package:flutter/material.dart';

import '../Utils/appstyle.dart';

class MyButton extends StatelessWidget {
  String title;
  void Function()? ontap;
   MyButton({required this.title, required this.ontap,super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(title,style: AppStyle.textStyle15Bold,),
        ),
      ),
    );
  }
}
