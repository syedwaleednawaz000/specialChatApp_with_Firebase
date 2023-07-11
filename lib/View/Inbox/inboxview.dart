import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parshot_app/Utils/appstyle.dart';

import '../../Widget/appbar.dart';
import '../Chat/chatview.dart';

class InboxView extends StatelessWidget {
  const InboxView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
           'Inbox', // Using null-aware operator to handle null values
          style: TextStyle(color: Colors.black),
        ),
        actions:  [
          GestureDetector(
              onTap: (){
                showDialog<void>(
                  context: context,
                  barrierDismissible: true,
                  // false = user must tap button, true = tap outside dialog
                  builder: (BuildContext dialogContext) {
                    return Dialog(
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.25,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            const SizedBox(height: 10,),
                            const Text("Enter channel name"),
                            const SizedBox(height: 10,),
                            TextFormField(
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Channel name"
                              ),
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                    onTap: (){
                                      Get.back();
                                    },
                                    child:  Text("Cancel",style: AppStyle.textStyle15Bold,)),
                                GestureDetector(
                                    onTap: (){},
                                    child:  Text("Create Channel",style: AppStyle.textStyle15Bold)),
                              ],
                            ),
                             SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: const Icon(Icons.more_vert_outlined,color: Colors.black,)),
          const SizedBox(width: 10,),
        ],

      ),
      body: Container(padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: ListView.builder(
                itemCount:20,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context , index){
              return             GestureDetector(
                  onLongPress: (){
                    showDialog<void>(
                      context: context,
                      barrierDismissible: true,
                      // false = user must tap button, true = tap outside dialog
                      builder: (BuildContext dialogContext) {
                        return Dialog(
                          child: Container(
                            height: MediaQuery.of(context).size.height*0.25,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                 SizedBox(height: MediaQuery.of(context).size.height*0.06,),
                                const Text("You want to sure delete this channel"),
                                // const SizedBox(height: 10,),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        Get.back();
                                      },
                                        child:  Text("Cancel",style: AppStyle.textStyle15Bold,)),
                                    GestureDetector(
                                        onTap: (){},
                                        child:  Text("Delete Channel",style: AppStyle.textRedStyle15Bold)),
                                  ],
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                onTap: (){
                  Get.to(                  ()=>  ChatView(
                    name: "waleed",
                    id: "23456789",
                    image: "cfvgbhnjmk",
                  ));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/Images/1680878481016.jpg"),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Waleed",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                          SizedBox(height: 5,),
                          Text("How are you"),
                        ],
                      ),
                      const Spacer(),
                      const Text("10/12/2012",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),

                    ],
                  ),
                ),
              );
            }))

          ],
        ),
      ),
    );
  }
}
