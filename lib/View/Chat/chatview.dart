import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parshot_app/Widget/auto_suggestion_textfield.dart';

import '../../Utils/appstyle.dart';
import '../../Widget/appbar.dart';
import 'audiorecord.dart';

class ChatView extends StatefulWidget {
  String? name , image , id ;
   ChatView({this.name, this.id, this.image,super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  TextEditingController? searchTextFieldController; // Change the type to TextEditingController

  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();

  List<String> suggestions = [
    'Syed',
    'Parashot',
    'Nawaz',
  ];

  String? selectedSuggestion = '';

  @override
  void initState() {
    super.initState();
    searchTextFieldController = TextEditingController(); // Initialize the TextEditingController
  }

  @override
  void dispose() {
    searchTextFieldController?.dispose(); // Dispose of the TextEditingController
    super.dispose();
  }

  List<bool> boolData = [
     true, false,false , true , true,
     true, false,false , true , true,
     true, false,false , true , true,
     true, false,false , true , true,
   ];

   Future<void> backButton()async{
     Get.back();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading:           GestureDetector(
            onTap: (){
              Get.back();
            },
            child: const Icon(Icons.arrow_back,color: Colors.black,)),
        title: Text(
          widget.name ?? '', // Using null-aware operator to handle null values
          style: const TextStyle(color: Colors.black),
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                             GestureDetector(
                                 onTap: (){
                                   backButton().then((value) {
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
                                                 const Text("Please add someone"),
                                                 const SizedBox(height: 10,),
                                                 AutoCompleteTextField<String>(
                                                   controller: searchTextFieldController, // Assign the TextEditingController to the controller parameter
                                                   key: key,
                                                   decoration: const InputDecoration(
                                                     hintText: 'Search',
                                                   ),
                                                   suggestions: suggestions,
                                                   itemFilter: (item, query) {
                                                     return item.toLowerCase().startsWith(query.toLowerCase());
                                                   },
                                                   itemSorter: (a, b) {
                                                     return a.compareTo(b);
                                                   },
                                                   itemSubmitted: (item) {
                                                     setState(() {
                                                       selectedSuggestion = '';
                                                       selectedSuggestion = item;
                                                     });
                                                   },
                                                   itemBuilder: (context, item) {
                                                     return ListTile(
                                                       title: Text(item),
                                                     );
                                                   },
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
                                                         child:  Text("Add",style: AppStyle.textStyle15Bold)),
                                                   ],
                                                 ),
                                                 SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                                               ],
                                             ),
                                           ),
                                         );
                                       },
                                     );
                                   });
                                 },
                                 child: Text("Add + ",style: AppStyle.textStyle15Bold,)),
                            const Divider(),
                             GestureDetector(
                                 onTap: (){
                                   backButton().then((value) {
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
                                                 const Text("Please remove someone"),
                                                 const SizedBox(height: 10,),
                                               AutoCompleteTextField<String>(
                                                 controller: searchTextFieldController, // Assign the TextEditingController to the controller parameter
                                                 key: key,
                                                 decoration: const InputDecoration(
                                                   hintText: 'Search',
                                                 ),
                                                 suggestions: suggestions,
                                                 itemFilter: (item, query) {
                                                   return item.toLowerCase().startsWith(query.toLowerCase());
                                                 },
                                                 itemSorter: (a, b) {
                                                   return a.compareTo(b);
                                                 },
                                                 itemSubmitted: (item) {
                                                   setState(() {
                                                     selectedSuggestion = '';
                                                     selectedSuggestion = item;
                                                   });
                                                 },
                                                 itemBuilder: (context, item) {
                                                   return ListTile(
                                                     title: Text(item),
                                                   );
                                                 },
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
                                                         child:  Text("Remove",style: AppStyle.textStyle15Bold)),
                                                   ],
                                                 ),
                                                 SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                                               ],
                                             ),
                                           ),
                                         );
                                       },
                                     );
                                   });
                                 },
                                 child: Text("Remove",style: AppStyle.textStyle15Bold)),
                            const Divider(),
                             GestureDetector(
                                 onTap: (){
                                   backButton().then((value) {
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
                                                 const Text("View all"),
                                                 Container(
                                                   height: MediaQuery.of(context).size.height*0.2,
                                                   child: ListView.builder(
                                                     physics: BouncingScrollPhysics(),
                                                       itemCount: 20,
                                                       itemBuilder: (context, index){
                                                     return Container(
                                                       padding: EdgeInsets.only(top: 10),
                                                       child: Text("waleed is ${index}"),
                                                     );
                                                   }),
                                                 )
                                               ],
                                             ),
                                           ),
                                         );
                                       },
                                     );
                                   });
                                 },
                                 child: Text("View All",style: AppStyle.textStyle15Bold)),
                            const Divider(),
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
                itemCount: boolData.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context , index){
                  return  Container(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    width: MediaQuery.of(context).size.width,
                    child: boolData[index] == true ?  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                        Text("Waleed",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                        const Spacer(),
                        // const Text("10/12/2012",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                      ],
                    ): Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Waleed",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                        // const Spacer(),
                        SizedBox(width: 10,),
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
                      ],
                    ),


                  );
                })),
            SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(bottom: 8.0),
                child:  Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                      onTap: (){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AudioRecordDialog();
                          },
                        );
                      },
                      child: const Icon(Icons.settings_voice)),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
