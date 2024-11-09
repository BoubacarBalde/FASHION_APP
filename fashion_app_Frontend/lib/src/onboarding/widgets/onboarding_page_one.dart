import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:fashion_app/common/utils/packages_exports.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:flutter/cupertino.dart';
import '../../../const/resource.dart';

class OnBoardinScreenOne extends StatelessWidget {
  const OnBoardinScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight,
      child: Stack(
        children: [
          Image.asset(R.ASSETS_IMAGES_EXPERIENCE_PNG,fit: BoxFit.cover),
          Positioned(
              bottom: 200,
              left: 30,
              right: 30,
              child: Text(AppText.kOnboardHome,
                textAlign: TextAlign.center,
                style: appStyle(13, Kolors.kGray, FontWeight.normal),
              )
          )
        ],
      ),
    );
  }
}
