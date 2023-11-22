

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../controller/provider/service/chatt_service.dart';
import 'widget/chat_bubble.dart';

class ConversationScreen extends StatefulWidget {
  ConversationScreen({super.key,required this.reciverUserID,required this.reciverUserEmail});
  final String reciverUserID;
  final String reciverUserEmail;

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  
  final TextEditingController messageController = TextEditingController();
  final ChatService chatService = ChatService();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void sendMessage()async{
    if(messageController.text.isNotEmpty){
      await chatService.sendMessage(widget.reciverUserID,messageController.text);
      messageController.clear();
    }
  }
  
  
Widget buildMessageInput(){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal:25.0),
    child: Row(children: [
      Expanded(child: 
      TextField(
        controller: messageController,
        obscureText: false,
        //hintText:,
        //style: TextStyle(),
        )
      
      
      ),
      IconButton(onPressed: sendMessage, icon: Icon(Icons.arrow_upward))
    ],),
  );
}




Widget buildMessageList(){
  return StreamBuilder(stream: chatService.getMessage(widget.reciverUserID,firebaseAuth.currentUser!.uid, ),builder: (context,snapshot){
      if(snapshot.hasError){
                    return Text('Erorr${snapshot.error}');
                  }
                  else if(snapshot.connectionState == ConnectionState.waiting){
                    return Text('Loading...');
                  }
                  else{
                    return ListView(
                      children: 
                        snapshot.data!.docs.map<Widget>((document)=> buildMessageItem(document))
                        .toList(),
                      
                    );
                  }
  });
}




Widget buildMessageItem(var document){
  Map<String,dynamic> data = document.data() as Map<String,dynamic>;
  var alinment = (data['senderId']== firebaseAuth.currentUser!.uid)
  ? Alignment.centerRight
  : Alignment.centerLeft;

  return Container(
    alignment: alinment,
    child:Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:(data['senderId']== firebaseAuth.currentUser!.uid)?
        CrossAxisAlignment.end
        :
        CrossAxisAlignment.start ,
        mainAxisAlignment: (data['senderId']== firebaseAuth.currentUser!.uid)?
        MainAxisAlignment.end
        :
        MainAxisAlignment.start ,
        children: [
        Text(data['senderEmail']),
        const SizedBox(height: 5),
        ChatBubble(message:data['message']),
      ],),
    )
  );
}



  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        title: Text(widget.reciverUserEmail),
      ),
      body: Column(
        children: [
          Expanded(child: buildMessageList(),
          ),
          buildMessageInput(),
          const SizedBox(height: 25,)
        ],
      )
    //  body: Container(),
    );
  }
}


