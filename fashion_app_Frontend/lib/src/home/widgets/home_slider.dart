import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/utils/packages_exports.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/custom_button.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/const/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import '../../../common/utils/kstrings.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: kRadiusAll,
      child: Stack(
        children: [
          SizedBox(
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().screenHeight*0.16,
            child: ImageSlideshow(
              indicatorColor: Kolors.kPrimaryLight,
              onPageChanged: (p){
              },
              autoPlayInterval: 5000,
              isLoop: true,
              children: List.generate(image.length, (i){
                return CachedNetworkImage(
                  placeholder: placeholder,
                  errorWidget: errorWidget,
                  imageUrl: image[i]
                );
              }),
            ),
          ),
          Positioned(
              child: SizedBox(
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().screenHeight*0.16,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(text: AppText.kCollection, style: appStyle(20, Kolors.kDark, FontWeight.w600)),
                      SizedBox(height: 5.h,),
                      Text('Discount 50% \nthe first transaction',style: appStyle(14, Kolors.kDark.withOpacity(.6), FontWeight.normal),),
                      SizedBox(height:10.h,),
                      CustomBotton(text: "Shop Now",btnWidth: 150.h,)
                    ],
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }
}

List<String> image = [
  "https://d326fntlu7tb1e.cloudfront.net/uploads/1.webp",
  "https://www.bing.com/images/search?view=detailV2&ccid=mvjQ5S6t&id=CB6E5D2E7A8066B2ADCEE0465280E8067AF05330&thid=OIP.mvjQ5S6tJEIYd8gt-Pnc7AHaCv&mediaurl=https%3a%2f%2fwww.vivedesigns.com%2fwp-content%2fuploads%2f2014%2f05%2fmay14.jpg&cdnurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.9af8d0e52ead24421877c82df8f9dcec%3frik%3dMFPwegbogFJG4A%26pid%3dImgRaw%26r%3d0&exph=315&expw=851&q=fashion+banner+image&simid=608032619613935610&FORM=IRPRST&ck=2BA746411C5EB1D627F361FFA83129D7&selectedIndex=49&itb=0",
  "https://d326fntlu7tb1e.cloudfront.net/uploads/1.webp",
  "https://d326fntlu7tb1e.cloudfront.net/uploads/1.webp",
];
