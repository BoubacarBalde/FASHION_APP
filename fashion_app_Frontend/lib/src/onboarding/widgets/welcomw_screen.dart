import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:fashion_app/common/utils/packages_exports.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/custom_button.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import '../../../const/resource.dart';

class WelcomScreen extends StatelessWidget {
  const WelcomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Kolors.kWhite,
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: Column(
          children: [
            SizedBox(
              height: 100.h,
            ),
            Image.asset(R.ASSETS_IMAGES_GETSTARTED_PNG),
            SizedBox(
              height: 30.h,
            ),
            Text(AppText.kWelcomeHeader, textAlign: TextAlign.center,style: appStyle(24, Kolors.kPrimary, FontWeight.bold),),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              width: ScreenUtil().screenWidth - 100,
              child: Text(
                 AppText.kWelcomeMessage,
                 textAlign: TextAlign.center,
                 style: appStyle(12, Kolors.kGray, FontWeight.normal),),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomBotton(
              text: AppText.kGetStarted,
              btnWidth: ScreenUtil().screenWidth - 100,
              btnHieght: 35.h,
              radius: 20,
              onTap: (){
               // TODO: uncomment the bool storage when the app is ready
               // Storage().setBool('firstOpen',true);
                context.go('/home');
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ReusableText(
                  text: "Already have an account?",
                  style: appStyle(12, Kolors.kDark, FontWeight.normal)
                ),
                TextButton(
                  onPressed: (){
                    //Navigate to login page
                    context.push('/login');
                  },
                  child: const Text('Sign in', style: TextStyle(fontSize: 12,color: Colors.blue),)
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
