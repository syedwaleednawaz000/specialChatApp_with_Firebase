import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parshot_app/Utils/appstyle.dart';
import 'package:parshot_app/View/LogIn/loginview.dart';
import 'package:parshot_app/Widget/appbar.dart';
import 'package:parshot_app/Widget/my_button.dart';
import 'package:parshot_app/Widget/my_textfield.dart';

class SignUpView extends StatefulWidget implements PreferredSizeWidget {
  SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  XFile? _image;
  Future<void> _openCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }
  Widget _buildImageDisplay() {
    if (_image == null) {
      return const Text('No image selected');
    } else {
      return Image.file(File(_image!.path,),height: 100,width: 100,);
    }
  }
  Future<void> registerUser(String name, String email, String password, XFile imageFile) async {
    try {
      // Initialize Firebase (if not done already)
      // await Firebase.initializeApp(); // Uncomment if Firebase is not initialized elsewhere

      // Create the user account in Firebase Authentication
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Upload the image file to Firebase Storage
      File file = File(imageFile.path);
      Reference storageReference = FirebaseStorage.instance.ref().child('user_images/${userCredential.user!.uid}.jpg');
      UploadTask uploadTask = storageReference.putFile(file);
      TaskSnapshot storageSnapshot = await uploadTask.whenComplete(() => null);
      String imageUrl = await storageSnapshot.ref.getDownloadURL();

      // Store user details in Firestore
      await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
        'name': name,
        'email': email,
        'imageUrl': imageUrl,
      });

      // Registration successful
      print('User registered successfully!');
    } catch (error) {
      // Registration failed
      print('Error registering user: $error');
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: MyAppBar(title: "SignUp",),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          width: double.infinity,
          padding:  EdgeInsets.only(left: 20,right: 20,top: MediaQuery.of(context).size.height*0.2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text("Name :", style: AppStyle.textStyle15Bold,),
              MyTextField(controller: nameController, hintText: "name"),
              const SizedBox(height: 10,),
              //email
               Text("Email :", style: AppStyle.textStyle15Bold,),
              MyTextField(controller: emailController, hintText: "Email"),
              const SizedBox(height: 10,),
              //password
               Text("Password :", style: AppStyle.textStyle15Bold,),
              MyTextField(controller: passwordController, hintText: "Password"),
              const SizedBox(height: 10,),
              Row(
                children: [
                  TextButton(
                    onPressed: _openCamera,
                    child: Text('Capture Image'),
                  ),
                  _buildImageDisplay(),
                ],
              ),
              const SizedBox(height: 10,),
              const SizedBox(height: 10,),
              MyButton(title: "SignUp", ontap: (){
                Get.to(()=> LoginView());
                // registerUser(nameController.text.trim(), emailController.text.trim(), passwordController.text.trim(), _image!);
              }),
              const SizedBox(height: 10,),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: (){
                    Get.to(()=> LoginView());
                  },
                  child:  Text("you have already an account",style: AppStyle.textStyle15Bold,),
                ),
              )
            ],
          ),
        ),
      )
    );
  }


  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
