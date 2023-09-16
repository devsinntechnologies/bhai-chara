
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../utils/app_colors.dart';

class LiveChatting extends StatefulWidget {
  const LiveChatting({super.key});

  @override
  State<LiveChatting> createState() => _LiveChattingState();
}

class _LiveChattingState extends State<LiveChatting> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.grey,
        appBar: AppBar(
          leadingWidth: 70,
          titleSpacing: 0,
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    //pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&w=1000&q=80'),
              )
            ],
          ),
          title: InkWell(
            onTap: () {
             // push(context, ProfileScreen());
            },
            child: Container(
              margin: EdgeInsets.all(7),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Laiba Azam",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "Online",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    ),
                  ]),
            ),
          ),
          backgroundColor: AppColors.white,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.videocam,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.call,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.black,
                )),
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(children: [
            ListView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 55,
                    child: Card(
                      margin: EdgeInsets.only(left: 2, right: 2, bottom: 8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        minLines: 1,
                        decoration: InputDecoration(
                          hintText: "Type a message",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(5),
                          prefixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.emoji_emotions),
                          ),
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.attach_file),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.camera_alt),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 2, right: 2, bottom: 8),
                    child: CircleAvatar(
                      radius: 25,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.mic,
                          color: AppColors.white,
                        ),
                        color: AppColors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BuildTextMesg("Hi, how are you doing today"),
                BuildReceiveMesg("I'm good , How are you doing today"),
                BuildTextMesg("I'm good too, what's up?"),
                BuildReceiveMesg("Nothing speciall"),
                BuildReceiveMesg("What's going on?"),
                BuildTextMesg("Working "),
                BuildReceiveMesg("That's good"),
                BuildTextMesg("Hi, how are uasdfghjk wertyu ertyui  fgbhnm, Hi, how are uasdfghjk wertyu ertyui  fgbhnm, ertyuio xcvbHi, how are uasdfghjk wertyu ertyui  fgbhnm, ertyuio xcvbHi, how are uasdfghjk wertyu ertyui  fgbhnm, ertyuio xcvbHi, how are uasdfghjk wertyu ertyui  fgbhnm, ertyuio xcvbHi, how are uasdfghjk wertyu ertyui  fgbhnm, ertyuio xcvbHi, how are uasdfghjk wertyu ertyui  fgbhnm, ertyuio xcvbHi, how are uasdfghjk wertyu ertyui  fgbhnm, ertyuio xcvbHi, how are uasdfghjk wertyu ertyui  fgbhnm, ertyuio xcvbHi, how are uasdfghjk wertyu ertyui  fgbhnm, ertyuio xcvbertyuio xcvb"),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

Widget BuildTextMesg(String ch) {
  return Padding(
    padding: const EdgeInsets.only(left: 10),
    child: Row(
      children: [
        CircleAvatar(
          radius: 15,
          backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&w=1000&q=80'),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors.white,
          ),
          child: Text(
            ch,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ],
    ),
  );
}

Widget BuildReceiveMesg(String ch) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        margin: EdgeInsets.only(right: 15, left: 150, top: 10, bottom: 10),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.blue,
        ),
        child: Text(
          ch,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColors.white),
        ),
      ),
    ],
  );
}
