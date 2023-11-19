import 'package:bhai_chara/view/chatting/controller/provider/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:bhai_chara/view/chatting/view/widget/chat_tile_widget.dart';
import 'dart:convert';
import 'package:bhai_chara/view/chatting/api/apis.dart';
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

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(builder: (context, chatVM, _) {
      return Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.5.w),
              child: searchField(),
            ),
            Expanded(
              child:StreamBuilder(
                stream: APIS.firestore.collection('users').snapshots(),
                builder: (context,snapshot){
                  final list = [];
                  if(snapshot.hasData){
                    final data = snapshot.data!.docs;
                   for(var i in data){
                      print('Data: ${jsonEncode(i.data())}');
                    list.add(i.data()["name"]);
                   }
                  }
                  return  ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return 
                 Text('name: ${list[index]}');
                  // Padding(
                  //   padding:
                  //       EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                  //   child: ChatTileWidget(
                  //     model: chatVM.listOfChatModel[index],
                  //   ),
                  // );
                },
              );
                }
              )
            ),
          ],
        ),
      );
    });
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
