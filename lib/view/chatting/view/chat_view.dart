import '../../../../utils/app_colors.dart';
import 'package:bhai_chara/utils/push.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'ConversationScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bhai_chara/utils/text-styles.dart';

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
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.white,
        title: Text("Chatt"),
        // actions: [
        //   IconButton(onPressed: (){
        //     FirebaseAuth.instance.signOut();
        //   }, icon: Icon(Icons.star)),
        // ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                  children: snapshot.data!.docs
                      .map((docs) => buildUserListItems(docs))
                      .toList());
            }

            return Text("Loading . . .");
          }),
    );
    // }

    // );
  }

  Widget buildUserListItems(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    if (auth.currentUser!.email != data['email']) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
        child: Column(
          children: [
            ListTile(
              trailing: Text(data['email'],
                  style: AppTextStyles.textStyleNormalBodyXSmall),
              leading: CircleAvatar(radius: 35),
              title: Text(data['name'].toString(),
                  style: AppTextStyles.textStyleNormalBodySmall),
              //  subtitle:  Text(' ',style:AppTextStyles.textStyleNormalBodyXSmall),
              onTap: () {
                push(
                    context,
                    ConversationScreen(
                      reciverUserID: data['uid'],
                      reciverUserEmail: data['email'],
                    ));
              },
            ),
            Divider(),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

//   Widget searchField() {
//     return TextFormField(
//       focusNode: searchFN,
//       controller: searchController,
//       keyboardType: TextInputType.text,
//       textInputAction: TextInputAction.done,
//       onChanged: (value) {
//         debugPrint('Search');
//         setState(() {});
//       },
//       onTap: () {
//         setState(() {});
//       },
//       onFieldSubmitted: (value) {
//         setState(() {});
//       },
//       // validator: FieldValidator.validateEmail,
//       // autovalidateMode: AutovalidateMode.onUserInteraction,
//       decoration: InputDecoration(
//          border: OutlineInputBorder(),
//         hintText: "Search",
//         icon: Icon(
//           Icons.search,
//           color: searchFN.hasFocus ? Colors.green : Colors.grey,
//         ),
//       ),
//     );
//   }
}
