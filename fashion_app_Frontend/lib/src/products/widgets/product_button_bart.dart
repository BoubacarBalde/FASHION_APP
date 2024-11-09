import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/utils/packages_exports.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ProductBottonBar extends StatelessWidget {
  const ProductBottonBar({super.key, required this.price, this.onPressed});

  final String price;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68.h,
      color: Colors.white.withOpacity(0.6),
      child: Padding(
        padding: EdgeInsets.fromLTRB(12.w, 0, 12.w, 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 60.h,
              width: 120.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:4.0),
                    child: ReusableText(text: 'Total Price', style: appStyle(14,Kolors.kGrayLight,FontWeight.w400)),
                  ),
                  ReusableText(text: '\$ $price', style: appStyle(16,Kolors.kDark,FontWeight.w600)),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Kolors.kPrimary)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(FontAwesome.shopping_bag,size: 16, color: Kolors.kWhite,),
                  SizedBox(width: 8.h,),
                  ReusableText(text: 'Checkout', style:appStyle(14,Kolors.kWhite,FontWeight.bold))
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
