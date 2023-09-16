import 'package:flutter/material.dart';

import '../../common/custom_appbar.dart';
import '../../utils/app_colors.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: CustomAppBar(
            title_text: "Account",
          )),
    );
  }
}
