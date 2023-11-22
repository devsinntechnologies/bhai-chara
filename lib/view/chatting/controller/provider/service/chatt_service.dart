import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../model/message.dart';



class ChatService extends ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> sendMessage(String recevierId,String message)async{


    final String currentUserId = firebaseAuth.currentUser!.uid;
    final String curentUserEmail = firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();
    Message newMessage = Message(
      senderId: currentUserId,
      senderEmail: curentUserEmail,
      receverId: recevierId,
      timestamp: timestamp,
      message: message,
    );

    List<String> ids = [currentUserId,recevierId];
    ids.sort();
    String chatRoomId = ids.join("_");
    await firestore.collection('chat_room').doc(chatRoomId).collection('message').add(newMessage.toMap());
      }


    Stream<QuerySnapshot> getMessage(String userId,String otherUserId){
       List<String> ids = [userId,otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");
    return firestore.collection('chat_room').doc(chatRoomId).collection('message').orderBy('timestamp',descending:false).snapshots();;
      
    }
}