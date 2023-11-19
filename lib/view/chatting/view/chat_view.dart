import 'package:bhai_chara/view/chatting/controller/provider/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:bhai_chara/view/chatting/view/widget/chat_tile_widget.dart';
import 'package:bhai_chara/view/chatting/model/chattUser.dart';

import 'dart:convert';
import 'package:bhai_chara/view/chatting/api/apis.dart';
class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
    List<ChattUser> list = [];
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
                  switch(snapshot.connectionState){
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                          return const Center(child: CircularProgressIndicator());
                    case ConnectionState.active:
                    case ConnectionState.done:
                               
                  
                    final data = snapshot.data!.docs;
                  list = data?.map((e) => ChattUser.fromJson(e.data())).toList()??[];
                  
                  return  ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return ChattUserCard(user: list[index],);
                
                },
              );

                  }
            
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
