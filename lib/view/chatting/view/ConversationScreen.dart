import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../utils/app_colors.dart';
import 'package:bhai_chara/utils/text-styles.dart';

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
  DateTime now = new DateTime.now();
   sendMessage() async {
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
              fillColor: Colors.grey,
              hintText: "Type Here",
              border: OutlineInputBorder(
                gapPadding: 8,
               borderRadius: BorderRadius.circular(30)
              ),
            ),
            controller: messageController,
            obscureText: false,
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
                 crossAxisAlignment:
                (data['senderId'] == firebaseAuth.currentUser!.uid)
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
            mainAxisAlignment:
                (data['senderId'] == firebaseAuth.currentUser!.uid)
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  data['senderId'] == firebaseAuth.currentUser!.uid
                     ? Text(" ") 
                     : CircleAvatar(radius: 15),
                  SizedBox(width:8),
                  Text(data['senderEmail']),
                ],
              ),
              const SizedBox(height: 5),
            
               ChatBubble(
                 message: data['message'],
                 time: DateFormat('dd/MMM/yyyy, hh:mm a').format(data['timestamp'].toDate()),
                 leftpadding:data['senderId'] == firebaseAuth.currentUser!.uid
                      ? 60
                      : 40,
                 rightpadding:data['senderId'] == firebaseAuth.currentUser!.uid
                      ? 0
                      : 40,
                 fontcolor:data['senderId'] == firebaseAuth.currentUser!.uid
                     ? AppColors.white
                     : AppColors.black,
                  timecolor:data['senderId'] == firebaseAuth.currentUser!.uid
                     ? AppColors.white
                     : AppColors.black,
                 color: data['senderId'] == firebaseAuth.currentUser!.uid
                     ? const Color.fromARGB(255, 5, 101, 179)
                     : AppColors.skyblue,
                 crossAxisAlignment: data['senderId'] == firebaseAuth.currentUser!.uid
                     ? CrossAxisAlignment.end
                     : CrossAxisAlignment.start,
                     
                     ),
                
                  
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90,
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.white,
        title:Text(widget.reciverUserEmail,style:AppTextStyles.textStyleBoldXLBodySmall.copyWith(color: AppColors.white)),
        leading:
         Row(
          children: [
            IconButton(icon:Icon(Icons.arrow_back_ios), onPressed: (){
            Navigator.pop(context);
            }),
            CircleAvatar(radius: 18),
          ],
        )
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
           
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
    );
  }
}
