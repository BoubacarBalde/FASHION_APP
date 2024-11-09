import 'package:flutter/cupertino.dart';
import '../../../common/utils/kcolors.dart';
import '../../../common/utils/kstrings.dart';
import '../../../common/utils/packages_exports.dart';
import '../../../common/widgets/app_style.dart';
import '../../../const/resource.dart';

class OnBoardinScreenTwo extends StatelessWidget {
  const OnBoardinScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight,
      child: Stack(
        children: [
          Image.asset(R.ASSETS_IMAGES_WISHLIST_PNG,fit: BoxFit.cover),
          Positioned(
              bottom: 200,
              left: 30,
              right: 30,
              child: Text(AppText.kOnboardWishList,
                textAlign: TextAlign.center,
                style: appStyle(13, Kolors.kGray, FontWeight.normal),
              )
          )
        ],
      ),
    );
  }
}
