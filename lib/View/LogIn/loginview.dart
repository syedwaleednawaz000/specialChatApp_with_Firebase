import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parshot_app/Utils/appstyle.dart';
import 'package:parshot_app/View/SignUp/signupview.dart';
import 'package:parshot_app/Widget/appbar.dart';

import '../../Widget/my_button.dart';
import '../../Widget/my_textfield.dart';
import '../Inbox/inboxview.dart';

class LoginView extends StatelessWidget {
   LoginView({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: MyAppBar(title: "Login",
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          width: double.infinity,
          padding:  EdgeInsets.only(left: 20,right: 20,top: MediaQuery.of(context).size.height*0.2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //email
               Text("Email :", style: AppStyle.textStyle15Bold,),
              MyTextField(controller: emailController, hintText: "Email"),
              const SizedBox(height: 10,),
              //password
               Text("Password :", style: AppStyle.textStyle15Bold,),
              MyTextField(controller: passwordController, hintText: "Password"),
              const SizedBox(height: 10,),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: (){
                    Get.to(()=> SignUpView());
                  },
                  child:  Text("Create new account",style: AppStyle.textStyle15Bold,),
                ),
              ),
              const SizedBox(height: 10,),
              MyButton(title: "Login", ontap: (){
                Get.to(()=> const InboxView());
                // registerUser(nameController.text.trim(), emailController.text.trim(), passwordController.text.trim(), _image!);
              })
            ],
          ),
        ),
      ),
    );
  }
}
