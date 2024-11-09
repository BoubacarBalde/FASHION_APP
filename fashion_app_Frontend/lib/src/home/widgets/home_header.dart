import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:fashion_app/common/utils/packages_exports.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:flutter/cupertino.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ReusableText(text: AppText.kCategory, style: appStyle(13, Kolors.kDark, FontWeight.w600)),
        GestureDetector(
           onTap: (){
             context.push('/categories');
           },
           child: ReusableText(text: AppText.kViewAll, style: appStyle(13, Kolors.kGray, FontWeight.normal)) ,
        )
      ],
    );
  }
}
