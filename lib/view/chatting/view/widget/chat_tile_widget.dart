// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:sizer/sizer.dart';

// import '../../controller/provider/chat_provider.dart';
// import '../../model/chat_model.dart';
// import '../conversation_screen.dart';

// class ChatTileWidget extends StatelessWidget {
//   final ChatModel? model;
//   ChatTileWidget({super.key, this.model});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ChatProvider>(builder: (context, chatVm, _) {
//       return Padding(
//         padding: const EdgeInsets.only(bottom: 8.0),
//         child: GestureDetector(
//           onTap: () => onTapFn(chatVM: chatVm, context: context),
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
//             //height: 20.h,
//             width: 100.w,
//             margin: const EdgeInsets.only(right: 5),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10.0),
//               color: model?.isRead == false ? Colors.yellow : Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.16),
//                   offset: const Offset(0, 2),
//                   blurRadius: 6,
//                 ),
//               ],
//             ),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(50),
//                   child: CachedNetworkImage(
//                     imageUrl: model?.userImage ??
//                         'https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1g z',
//                     imageBuilder: (context, imageProvider) => Container(
//                       height: 13.w,
//                       width: 13.w,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                           image: imageProvider,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     fit: BoxFit.cover,
//                     errorWidget: (context, url, e) => SizedBox(
//                         height: 13.w,
//                         width: 13.w,
//                         child: const Icon(Icons.error)),
//                     placeholder: (context, url) {
//                       return Center(
//                           child: SizedBox(
//                         height: 13.w,
//                         width: 13.w,
//                         child: const CircularProgressIndicator.adaptive(
//                             backgroundColor: Colors.red),
//                       ));
//                     },
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 10.0,
//                 ),
//                 Expanded(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         model?.userName ?? "",
//                         overflow: TextOverflow.ellipsis,
//                         style: const TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.w600),
//                         //style: AppTextStyles.textStyleNormalBodyMedium,
//                       ),
//                       const Text(
//                         'Hi , This is my new message',
//                         style: TextStyle(color: Colors.black),
//                         //style: AppTextStyles.textStyleNormalBodyMedium,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Text(
//                   DateFormat('hh:mm a').format(model?.time ?? DateTime.now()),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     });
//   }

//   void onTapFn({required ChatProvider chatVM, required BuildContext context}) {
//     model?.isRead = true;
//     chatVM.update();
//     print('Navigating to ConversationScreen with model: $model');
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ConversationScreen(model: model),
//       ),
//     );
//     //Get.toNamed(ChatBetweenUsers.route, arguments: {'model': model});
//   }
// }
