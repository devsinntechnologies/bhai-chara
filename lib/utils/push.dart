import 'package:bhai_chara/utils/text-styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

push(context, screen) {
  Navigator.push(
    context,
    CupertinoPageRoute(builder: (context) => screen),
  );
}

pop(context) {
  Navigator.pop(
    context,
  );
}

pushUntil(context, screen) {
  Navigator.pushAndRemoveUntil(
      context, CupertinoPageRoute(builder: (_) => screen), (route) => false);
}

BottomSheetFunction(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bs) {
        return Scaffold(
            body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'How satisfied are you with the Bhai Chara app?',
                textAlign: TextAlign.center,
                style: AppTextStyles.textStyleBoldBodySmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Icon(Icons.emoji_emotions),
                      Text(
                        'Hate',
                        style: AppTextStyles.textStyleNormalBodyXSmall,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Icon(Icons.emoji_emotions),
                      Text(
                        'Dislike',
                        style: AppTextStyles.textStyleNormalBodySmall,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Icon(Icons.emoji_emotions),
                      Text(
                        'Natural',
                        style: AppTextStyles.textStyleNormalBodySmall,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Icon(Icons.emoji_emotions),
                      Text(
                        'Like',
                        style: AppTextStyles.textStyleNormalBodySmall,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Icon(Icons.emoji_emotions),
                      Text(
                        'Love',
                        style: AppTextStyles.textStyleNormalBodySmall,
                      )
                    ],
                  )
                ],
              ),
            )
          ]),
        ));
      });
}
