import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/view/chatting/controller/provider/chat_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'ConversationScreen.dart';
import 'widget/chat_tile_widget.dart';
import 'package:provider/provider.dart';
import 'package:bhai_chara/controller/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:bhai_chara/lib/controller/services/auth_service.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  FocusNode searchFN = FocusNode();
  TextEditingController searchController = TextEditingController();
  PageController pageMove = PageController();
  int chatTypePageIndex = 0;
  final FirebaseAuth auth = FirebaseAuth.instance;
  // final authService = Provider.of<AuthService>(context,listen: false);


  @override
  Widget build(BuildContext context) {
    return 
    // Consumer<ChatProvider>(builder: (context, chatVM, _) {
    //   return 
      Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.5.w),
              child: searchField(),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (context,snapshot){
                  if(snapshot.hasError){
                    return Text('Erorr');
                  }
                  else if(snapshot.connectionState == ConnectionState.waiting){
                    return Text('Loading...');
                  }
                  else{
                    return ListView(
                      children: 
                        snapshot.data!.docs.map<Widget>((docs)=> buildUserListItems(docs))
                        .toList(),
                      
                    );
                  }
              }
            ),
            ],
        ),
      );
   // }
    
   // );
  }

    Widget buildUserListItems(DocumentSnapshot document){
    Map<String,dynamic> data= document.data()! as Map<String,dynamic>;
    
    if(auth.currentUser!.email != data['email']){
      return ListTile(
        title:Text( data['email'],),
        onTap: (){
          push(context,ConversationScreen(
              reciverUserID: data['uid'],
              reciverUserEmail:data['email'],

          ));
        },
      );
    }
    else{
      return Container();
    }
  
  } 



  Widget searchField() {
    return TextFormField(
      focusNode: searchFN,
      controller: searchController,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      onChanged: (value) {
        debugPrint('Search');
        setState(() {});
      },
      onTap: () {
        setState(() {});
      },
      onFieldSubmitted: (value) {
        setState(() {});
      },
      // validator: FieldValidator.validateEmail,
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: "Search",
        icon: Icon(
          Icons.search,
          color: searchFN.hasFocus ? Colors.green : Colors.grey,
        ),
      ),
    );
  }

}
