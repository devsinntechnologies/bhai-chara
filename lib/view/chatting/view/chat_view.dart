import 'package:bhai_chara/view/chatting/model/message.dart';
import 'package:bhai_chara/view/chatting/model/message.dart';
import '../../../../utils/app_colors.dart';
import 'package:bhai_chara/utils/push.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'ConversationScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ChatView extends StatefulWidget {
  // int msg;
   ChatView({super.key,
  //  required this.msg
   });

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  FocusNode searchFN = FocusNode();
  TextEditingController searchController = TextEditingController();
  PageController pageMove = PageController();
  int chatTypePageIndex = 0;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.white,
        title: Text("Chatt"),
      
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData ) {
              // if(FirebaseFirestore.instance.collection('chat_room').doc().collection('message').id.isNotEmpty)
              return Column(
                  children:snapshot.data!.docs
                      .map((docs) => buildUserListItems(docs))
                      .toList()
            );
            // else{
            //   Text("check condition");
            // }
             }

            return Text("Loading . . .");
          }),
    );
  }

  Widget buildUserListItems(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

var doc=FirebaseFirestore.instance
    .collection('chat_room')
    .doc()
    .collection('message').where("senderEmail");
    print(doc);
    
    if (
      // auth.currentUser!.email = doc
      (auth.currentUser!.email != data['email']) 
    ) {
      //  if(doc = auth.currentUser!.email)
       return
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
        child: Column(
          children: [
            // searchField(),
            ListTile(
              trailing: Text(data['email'],
                  style: AppTextStyles.textStyleNormalBodyXSmall),
              leading: CircleAvatar(radius: 35),
              title: Text(data['name'].toString(),
                  style: AppTextStyles.textStyleNormalBodySmall),
              //  subtitle:  Text(' ',style:AppTextStyles.textStyleNormalBodyXSmall),
              onTap: () {
                push(
                    context,
                    ConversationScreen(
                      reciverUserID: data['uid'],
                      reciverUserEmail: data['email'],
                    ));
              },
            ),
            Divider(),
          ],
        ),
      );
    }
    else {
      return Container(  
      );
    }
  

  
  
  // Widget searchField() {
  //   return TextFormField(
  //     focusNode: searchFN,
  //     controller: searchController,
  //     keyboardType: TextInputType.text,
  //     textInputAction: TextInputAction.done,
  //     onChanged: (value) {
  //       debugPrint('Search');
  //       setState(() {});
  //     },
  //     onTap: () {
  //       setState(() {});
  //     },
  //     onFieldSubmitted: (value) {
  //       setState(() {});
  //     },
  //     // validator: FieldValidator.validateEmail,
  //     // autovalidateMode: AutovalidateMode.onUserInteraction,
  //     decoration: InputDecoration(
  //        border: OutlineInputBorder(),
  //       hintText: "Search",
  //       icon: Icon(
  //         Icons.search,
  //         color: searchFN.hasFocus ? Colors.green : Colors.grey,
  //       ),
  //     ),
  //   );
  // }


}
}