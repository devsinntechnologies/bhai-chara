import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/utils/custom_loader.dart';
import 'package:bhai_chara/utils/text-styles.dart';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../../controller/provider/authentication_provider/auth_provider.dart';
import '../../utils/push.dart';
import '../home-screens/root_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  // ignore: unused_field
  Position? _currentPosition;
  String _currentAddress = "";
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var size = MediaQuery.of(context).size * 1;
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(10),
          child: Builder(builder: (context) {
            var pro = context.watch<AuthProvider>();
            return pro.isLoading
                ? Center(child: CustomLoader())
                : Column(
                    children: [
                      const SizedBox(
                        height: 80,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 200,
                            width: size.width * .90,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/location_animated.png"),
                                    fit: BoxFit.contain)),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: size.width,
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "Where do you want to buy/sell products",
                          style: AppTextStyles.textStyleBoldBodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: size.width * .85,
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          "To unlock the full Bhai Chara experience, we need to know where to look for them.",
                          style: AppTextStyles.textStyleNormalBodyXSmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () async {
                          var loc = context.read<AuthProvider>();
                          loc.Location(
                              context, _currentPosition, _currentAddress);
                          push(context, RootScreen());
                        },
                        child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.blue),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  child: const Image(
                                    image: AssetImage(
                                        "assets/images/location_arrow.png"),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Near me",
                                  style: AppTextStyles
                                      .textStyleNormalBodySmall_WhiteColor,
                                ),
                              ],
                            )),
                      ),
                      const Spacer(),
                    ],
                  );
          }),
        ),
      ),
    );
  }
}
