import 'package:bhai_chara/utils/chat_tile_widget.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../controller/provider/chat_provider.dart';


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
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1.5),
              child: searchField(),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: chatVM.listOfChatModel.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                    child: ChatTileWidget(
                      model: chatVM.listOfChatModel[index],
                    ),
                  );
                },
              ),
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

  // Widget individualChatView({required ChatProvider chatVM}) {
  //   return ChatTileWidget(
  //     model: searchList[index],
  //   );
  // }
}
