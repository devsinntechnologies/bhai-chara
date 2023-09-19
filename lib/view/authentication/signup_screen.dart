import 'package:bhai_chara/utils/app_colors.dart';
import 'package:bhai_chara/common/custom_container_tile.dart';
import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:bhai_chara/view/authentication/otp_code_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  // Function to handle Google Sign-In
  Future<User?> _handleSignInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      final User? user = authResult.user;

      return user;
    } catch (error) {
      print("Google Sign-In Error: $error");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 130,
                    width: 100,
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        image: const DecorationImage(
                            scale: 1,
                            image: AssetImage("assets/images/logo.png"),
                            fit: BoxFit.fill)),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: size.width * .85,
                      child: Text(
                        "Where trust unites buyers and seller in a strong community",
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.textStyleNormalBodyMedium,
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomContainerTile(
                tap: () async {
                    print("Google button tapped"); // Add this line
                  User? user = await _handleSignInWithGoogle();
                  if (user != null) {
                    push(context, OTPScreen());
                    // Handle successful sign-in, navigate to the next screen, or perform other actions.
                    // Example: Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NextScreen()));
                  } else {
                    // Handle sign-in error or cancellation.
                  }
                },
                image: "assets/images/google.png",
                text: "Continue with Google",
                style_text: AppTextStyles.textStyleNormalBoldXLBodySmall,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomContainerTile(
                tap: () {},
                image: "assets/images/facebook.png",
                text: "Continue with Facebook",
                style_text: AppTextStyles.textStyleNormalBoldXLBodySmall,
              ),
              SizedBox(
                height: 20,
              ),
              CustomContainerTile(
                tap: () {},
                image: "assets/images/mail.png",
                text: "Continue with Email",
                style_text: AppTextStyles.textStyleNormalBoldXLBodySmall,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomContainerTile(
                tap: () {},
                image: "assets/images/phone.png",
                text: "Continue with Phone",
                style_text: AppTextStyles.textStyleNormalBoldXLBodySmall,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "If you continue, you are accepting",
                    style: AppTextStyles.textStyleNormalXLBodySmall,
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Container(
                child: RichText(
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: true,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Bhai Chara ",
                        style: AppTextStyles.textStyleBoldBodyXSmall,
                      ),
                      TextSpan(
                        text: "Terms and Conditions ",
                        style: AppTextStyles
                            .textStyleNormalBody_BlueColor_Underline,
                      ),
                      TextSpan(
                        text: "and ",
                        style: AppTextStyles.textStyleBoldBodyXSmall,
                      ),
                      TextSpan(
                        text: "Privacy",
                        style: AppTextStyles
                            .textStyleNormalBody_BlueColor_Underline,
                      ),
                      const TextSpan(
                        text: " ",
                      ),
                      TextSpan(
                        text: "Policy",
                        style: AppTextStyles
                            .textStyleNormalBody_BlueColor_Underline,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
