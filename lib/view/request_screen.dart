import 'package:bhai_chara/common/custom_button.dart';
import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:bhai_chara/view/home-screens/root_screen.dart';
import 'package:flutter/material.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.blue,
              ),
              child: Center(
                child: Icon(
                  Icons.done,
                  size: 30,
                  color: AppColors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Thank you for the request, we'll get in contact within 1 hour.",
              style: AppTextStyles.textStyleBoldBodyMedium,
              maxLines: 2,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "You're welcome! If you have any specific requests or questions, please feel free to ask, and I'll do my best to assist you.",
              style: AppTextStyles.textStyleNormalBodyMedium,
              maxLines: 4,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50,
            ),
            CustomButton(
              onTap: () {
                pushUntil(context, RootScreen());
              },
              text: "Check Your Inbox",
              width: size.width * .60,
            )
          ],
        ),
      ),
    );
  }
}
