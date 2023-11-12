import 'package:flutter/material.dart';

import '../../model/chat_model.dart';
import '../../resource/app_images.dart';

class ChatProvider extends ChangeNotifier {
  List<ChatModel> listOfChatModel = [
    ChatModel(
        isRead: false,
        userImage: AppImages.dummyImage,
        userName: "Ross Galler",
        time: DateTime.now()),
    ChatModel(
        isRead: true,
        userImage: AppImages.dummyImage,
        userName: "Alexander A.",
        time: DateTime.now()),
    ChatModel(
        isRead: true,
        userImage: AppImages.dummyImage,
        userName: "William M.",
        time: DateTime.now()),
  ];

  List<ChatMessageModel> chatMessageList = [
    ChatMessageModel(
        time: DateTime.now(),
        message: "Hello!",
        isReceiver: false,
        // isOffer: false,
        // price: 0,
        title: ""),
    ChatMessageModel(
        time: DateTime.now(),
        message: "How are you?",
        isReceiver: true,
        // isOffer: false,
        // price: 0,
        title: ""),
    ChatMessageModel(
        time: DateTime.now(),
        message: "How are you?",
        isReceiver: true,
        // isOffer: false,
        // price: 0,
        title: ""),
    ChatMessageModel(
        time: DateTime.now(),
        message: "I am waiting.",
        isReceiver: false,
        // isOffer: true,
        // price: 20,
        title: "test"),
    ChatMessageModel(
        time: DateTime.now(),
        message: "I am waiting for your response,..",
        isReceiver: false,
        // isOffer: false,
        // price: 0,
        title: ""),
  ];

  void update() {
    notifyListeners();
  }
}
