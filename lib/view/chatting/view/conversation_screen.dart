// import 'package:bhai_chara/view/chatting/model/chat_model.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:sizer/sizer.dart';
// import '../controller/provider/chat_provider.dart';

// class ConversationScreen extends StatefulWidget {
//   const ConversationScreen({super.key, ChatModel? model});

//   @override
//   State<ConversationScreen> createState() => _ConversationScreenState();
// }

// class _ConversationScreenState extends State<ConversationScreen> {
//   ChatModel? model;
//   TextEditingController controller = TextEditingController();
//   final ScrollController _scrollController = ScrollController();

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ChatProvider>(builder: (context, chatVM, _) {
//       return Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: Colors.white,
//           toolbarHeight: 70,
//           centerTitle: false,
//           leadingWidth: 5,
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               // InkWell(
//               //   onTap: () {},
//               //   child: const Padding(
//               //     padding: EdgeInsets.all(8.0),
//               //     child: Icon(
//               //       Icons.arrow_back_outlined,
//               //       color: Colors.black,
//               //     ),
//               //   ),
//               // ),
//               SizedBox(
//                 width: 10,
//               ),
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(20),
//                 child: CachedNetworkImage(
//                   imageUrl: model?.userImage ??
//                       'https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1g z',
//                   imageBuilder: (context, imageProvider) => Container(
//                     height: 10.w,
//                     width: 10.w,
//                     // height: 40,
//                     // width: 40,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(
//                         color: Colors.red,
//                         width: 1,
//                       ),
//                       image: DecorationImage(
//                         image: imageProvider,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   fit: BoxFit.cover,
//                   errorWidget: (context, url, e) => const Icon(Icons.error),
//                   placeholder: (context, url) {
//                     return const Center(
//                         child: CircularProgressIndicator.adaptive(
//                       backgroundColor: Colors.red,
//                     ));
//                   },
//                 ),
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     model?.userName ?? "",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 14.sp,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//         body: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 2.h),
//               child: Text(
//                 DateFormat("EEEE, hh:mm a").format(DateTime.now()),
//                 textAlign: TextAlign.end,
//                 style:
//                     TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
//               ),
//             ),
//             Expanded(
//               child: ListView(
//                 controller: _scrollController,
//                 children: List.generate(chatVM.chatMessageList.length, (index) {
//                   if (chatVM.chatMessageList[index].isReceiver) {
//                     return sender(
//                       message: chatVM.chatMessageList[index].message ?? '',
//                       time:
//                           chatVM.chatMessageList[index].time ?? DateTime.now(),
//                     );
//                   } else {
//                     return receiver(
//                       message: chatVM.chatMessageList[index].message ?? '',
//                       time:
//                           chatVM.chatMessageList[index].time ?? DateTime.now(),
//                     );
//                   }
//                 }),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextFormField(
//                       controller: controller,
//                       onFieldSubmitted: (val) {
//                         if (controller.text.isNotEmpty) {
//                           chatVM.chatMessageList.add(
//                             ChatMessageModel(
//                                 time: DateTime.now(),
//                                 message: val,
//                                 isReceiver: true,
//                                 // isOffer: false,
//                                 // price: 0,
//                                 title: ""),
//                           );
//                           chatVM.update();
//                           controller.clear();

//                           ///Scroll
//                           _scrollDown();
//                         }
//                       },
//                       maxLines: 3,
//                       minLines: 1,
//                       textInputAction: TextInputAction.newline,
//                       decoration: InputDecoration(
//                         contentPadding: const EdgeInsets.symmetric(
//                             horizontal: 20, vertical: 15),
//                         hintText: "Write a Message...",
//                         hintStyle: TextStyle(
//                           fontSize: 12.sp,
//                           color: Colors.grey,
//                           fontWeight: FontWeight.w300,
//                         ),
//                         filled: true,
//                         isDense: true,
//                         fillColor: Colors.white,
//                         errorBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(22),
//                           borderSide: const BorderSide(color: Colors.grey),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(22),
//                           borderSide: const BorderSide(color: Colors.grey),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(22),
//                           borderSide: const BorderSide(color: Colors.grey),
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(22),
//                           borderSide: const BorderSide(color: Colors.grey),
//                         ),
//                       ),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       if (controller.text.isNotEmpty) {
//                         chatVM.chatMessageList.add(
//                           ChatMessageModel(
//                               time: DateTime.now(),
//                               message: controller.text.trim(),
//                               isReceiver: true,
//                               // isOffer: false,
//                               // price: 0,
//                               title: ""),
//                         );
//                         chatVM.update();
//                         controller.clear();

//                         ///Scroll
//                         _scrollDown();
//                       }
//                     },
//                     child: Container(
//                       margin: EdgeInsets.only(left: 2.w),
//                       padding: EdgeInsets.symmetric(
//                           vertical: 1.4.h, horizontal: 3.w),
//                       decoration: BoxDecoration(
//                         color: Colors.red,
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                       child: Image.asset(
//                         'assets/images/send_message.png',
//                         height: 28,
//                         width: 28,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );
//     });
//   }

//   Widget sender({required String message, required DateTime time}) {
//     return Align(
//       alignment: Alignment.centerRight,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Container(
//               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//               margin: const EdgeInsets.symmetric(vertical: 5),
//               decoration: const BoxDecoration(
//                 color: Colors.red,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(34),
//                   topRight: Radius.circular(34),
//                   bottomLeft: Radius.circular(34),
//                   bottomRight: Radius.circular(0),
//                 ),
//               ),
//               child: ConstrainedBox(
//                 constraints: BoxConstraints(
//                   maxWidth: 60.w,
//                   minHeight: 3.h,
//                 ),
//                 child: Text(
//                   message,
//                   style: TextStyle(
//                     fontSize: 10.sp,
//                     color: Colors.white,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             Text(
//               DateFormat("hh:mm a").format(time),
//               textAlign: TextAlign.end,
//               style: TextStyle(
//                 fontSize: 8.sp,
//                 color: Colors.black,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// Message You Receive
//   Widget receiver({
//     required String message,
//     required DateTime time,
//   }) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             SizedBox(
//               width: 5,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                   margin: const EdgeInsets.symmetric(vertical: 5),
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: const BorderRadius.only(
//                         topLeft: Radius.circular(34),
//                         topRight: Radius.circular(34),
//                         bottomLeft: Radius.circular(0),
//                         bottomRight: Radius.circular(34),
//                       ),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.26),
//                           offset: const Offset(10.0, 0),
//                           blurRadius: 35.0,
//                         ),
//                       ]),
//                   child: ConstrainedBox(
//                     constraints: BoxConstraints(
//                       maxWidth: 60.w,
//                       minHeight: 3.h,
//                     ),
//                     child: Text(
//                       message,
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 10.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Text(
//                   DateFormat("hh:mm a").format(time),
//                   textAlign: TextAlign.end,
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 8.sp,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _scrollDown() {
//     _scrollController.animateTo(
//       _scrollController.position.maxScrollExtent + 100.h,
//       duration: const Duration(milliseconds: 500),
//       curve: Curves.easeOut,
//     );
//   }
// }
