import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../utils/app_colors.dart';

import '../controller/service/chatt_service.dart';
import 'widget/chat_bubble.dart';

class ConversationScreen extends StatefulWidget {
  ConversationScreen(
      {super.key, required this.reciverUserID, required this.reciverUserEmail});
  final String reciverUserID;
  final String reciverUserEmail;

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  final TextEditingController messageController = TextEditingController();
  final ChatService chatService = ChatService();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async {
    if (messageController.text.isNotEmpty) {
      await chatService.sendMessage(
          widget.reciverUserID, messageController.text);
      messageController.clear();
    }
  }

  Widget buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(30)
              ),
            ),
            controller: messageController,
            obscureText: false,
            //hintText:,
            //style: TextStyle(),
          )),
          SizedBox(width: 15),
          CircleAvatar(
              radius: 30,
              child: IconButton(
                  onPressed: sendMessage, icon: Icon(Icons.send))),
        ],
      ),
    );
  }

  Widget buildMessageList() {
    return StreamBuilder(
        stream: chatService.getMessage(
          widget.reciverUserID,
          firebaseAuth.currentUser!.uid,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Erorr${snapshot.error}');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading...');
          } else {
            return ListView(
              children: snapshot.data!.docs
                  .map<Widget>((document) => buildMessageItem(document))
                  .toList(),
            );
          }
        });
  }

  Widget buildMessageItem(var document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    var alinment = (data['senderId'] == firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Container(
        alignment: alinment,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment:
                (data['senderId'] == firebaseAuth.currentUser!.uid)
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
            mainAxisAlignment:
                (data['senderId'] == firebaseAuth.currentUser!.uid)
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  data['senderId'] == firebaseAuth.currentUser!.uid
                     ? Text(" ") :CircleAvatar(radius: 15),
                  Text(data['senderEmail']),
                ],
              ),
              const SizedBox(height: 5),
              
                                ChatBubble(
                 message: data['message'],
                 color: data['senderId'] == firebaseAuth.currentUser!.uid
                     ? AppColors.blue
                     : AppColors.skyblue),

                     Row(
                      
                       crossAxisAlignment:
                (data['senderId'] == firebaseAuth.currentUser!.uid)
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
            mainAxisAlignment:
                (data['senderId'] == firebaseAuth.currentUser!.uid)
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                      children:[
                      Text(data['timestamp']),
                       
                    
                     ])
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.white,
        title: Text(widget.reciverUserEmail),
        leading: CircleAvatar(radius: 20)
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            // gradient:
            // gradient: LinearGradient(
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            //   colors: [
            //   Color.fromARGB(255, 142, 189, 250),
            //   AppColors.white,
            //   AppColors.grey
            // ]),
          ),
          child: Column(
            children: [
              Expanded(
                child: buildMessageList(),
              ),
              buildMessageInput(),
              const SizedBox(
                height: 25,
              )
            ],
          )),
      //  body: Container(),
    );
  }
}
