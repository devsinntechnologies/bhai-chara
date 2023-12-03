import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/view/authentication/login_screen.dart';
import 'package:bhai_chara/view/authentication/signup_screen.dart';
import 'package:bhai_chara/view/settings-screens/dialogBox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/container.dart';
import '../../utils/text-styles.dart';

class ManageAccountScreen extends StatefulWidget {
  const ManageAccountScreen({super.key});

  @override
  State<ManageAccountScreen> createState() => _ManageAccountScreenState();
}

class _ManageAccountScreenState extends State<ManageAccountScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomContainer(
              text: 'Manage Account',
              iconVar: Icons.arrow_back_ios,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                      pushUntil(context, const LoginScreen());
                    },
                    child: Container(
                      height: 50,
                      width: size.width,
                      child: Center(
                          child: Text(
                        "Logout",
                        style: AppTextStyles.textStyleBoldBodyMedium,
                      )),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.blue,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    thickness: 2,
                    color: AppColors.dividerColor,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (
                            context,
                          ) {
                            return const DialogBox();
                          });
                    },
                    child: ListTile(
                      title: Text("Delete Account",
                          style: AppTextStyles.textStyleBoldBodyMedium),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 24,
                        color: AppColors.TextColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
