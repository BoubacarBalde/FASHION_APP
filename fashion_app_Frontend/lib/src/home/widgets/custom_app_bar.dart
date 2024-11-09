import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/utils/packages_exports.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'notification_widget.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 3.0),
            child: ReusableText(text: 'Location', style: appStyle(12, Kolors.kGray, FontWeight.normal)),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Icon(Ionicons.location, size: 16,color: Kolors.kPrimary,),
              Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child:SizedBox(
                  width: ScreenUtil().screenWidth * 0.7,
                  child: Text(
                    "Please Select a Location",
                    maxLines: 1,
                    style: appStyle(14, Kolors.kDark, FontWeight.w500),
                    ),
                ),
              ),
            ],
          )
        ],
      ),
      actions: const [NotificationWidet()],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(55.h),
        child: GestureDetector(
          onTap: (){
            context.push('/search');
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: ScreenUtil().screenWidth-80,
                  height: 40.h,
                  decoration: BoxDecoration(
                    border: Border.all(width:1,color: Kolors.kGrayLight),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                       children: [
                         const Icon(Ionicons.search,color: Kolors.kPrimaryLight,size: 20,),
                         SizedBox(width: 20.w,),
                         ReusableText(
                           text: "Search product",
                           style: appStyle(14, Kolors.kGray, FontWeight.w400)
                         )
                       ],
                    ),
                  ),
                ),
                Container(
                  width: 40.h,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: Kolors.kPrimary,
                    borderRadius: BorderRadius.circular(9)
                  ),
                  child: const Icon(FontAwesome.sliders, color: Kolors.kWhite,),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
