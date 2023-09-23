import 'package:bhai_chara/view/settings-screens/dialogBox.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.App,
        leading: Icon(
          Icons.arrow_back_ios,
          // color: AppColors.primary,
          color: AppColors.primary,
          size: 24,
        ),
        title: Text(
          "Manage Account",
          style: AppTextStyles.textStyleBoldBodyMedium
              .copyWith(color: AppColors.primary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
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
            SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 2,
              color: AppColors.dividerColor,
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: (){
                 showDialog(
                context: context,
                builder: (
                  context,
                ) {
                  return DialogBox();
                });
              },
              child: ListTile(
                title: Text("Delete Account",
                    style: AppTextStyles.textStyleBoldBodyMedium),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 24,
                  color: AppColors.TextColor,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              // height: 200,
              width: size.width,
              //
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Icon(
                    Icons.delete,
                    color: AppColors.blue,
                    size: 32,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Are your sure?",
                    style: AppTextStyles.textStyleBoldBodyMedium,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "All your ada will be set to inactive and will not be showing to the users",
                    style: AppTextStyles.textStyleNormalBodySmall,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: size.width * .35,
                        child: Center(
                          child: Text(
                            "Cancel",
                            style: AppTextStyles.textStyleBoldBodyMedium
                                .copyWith(color: AppColors.blue),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppColors.blue,
                            width: 2,
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 60,
                        width: size.width * .35,
                        child: Center(
                          child: Text(
                            "Delete",
                            style: AppTextStyles.textStyleBoldBodyMedium
                                .copyWith(color: AppColors.primary),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.blue,
                          borderRadius: BorderRadius.circular(20),
                          // border: Border.all(
                          //   color: AppColors.blue,
                          //   width: 2,
                          // ),
                        ),
                      ),
                    ],
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
