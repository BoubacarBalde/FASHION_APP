// import 'package:fashion_app/common/widgets/reusable_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';
//
// import '../../const/constants.dart';
// import '../utils/kcolors.dart';
// import '../utils/kstrings.dart';
// import 'app_style.dart';
// import 'custom_button.dart';
//
// Future<dynamic> deleteCartBottomSheet(
//     BuildContext context, int id, void Function() refetch) {
//   return showModalBottomSheet<void>(
//     context: context,
//     builder: (BuildContext context) {
//       return Container(
//         height: 200,
//         decoration: BoxDecoration(borderRadius: kRadiusTop),
//         child: ListView(
//           children: [
//             SizedBox(
//               height: 10.h,
//             ),
//             Center(
//                 child: ReusableText(
//                     text: AppText.kDeleteCart,
//                     style: appStyle(16, Kolors.kPrimary, FontWeight.w500))),
//             SizedBox(
//               height: 10.h,
//             ),
//             Divider(
//               color: Kolors.kGrayLight,
//               thickness: 0.5.h,
//             ),
//             SizedBox(
//               height: 10.h,
//             ),
//             Center(
//                 child: ReusableText(
//                     text: AppText.kDelCartMessage,
//                     style: appStyle(14, Kolors.kGray, FontWeight.w500))),
//             SizedBox(
//               height: 20.h,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GradientBtn(
//                     text: "Cancel",
//                     borderColor: Kolors.kDark,
//                     btnColor: Kolors.kWhite,
//                     onTap: () => Navigator.pop(context),
//                     btnHieght: 35.h,
//                     radius: 16,
//                     btnWidth: ScreenUtil().screenWidth / 2.2,
//                   ),
//                   GradientBtn(
//                     text: "Yes, Delete",
//                     onTap: () {
//                       context
//                           .read<CartNotifier>()
//                           .deleteCart(id, refetch, context);
//
//                     },
//                     btnColor: Kolors.kRed,
//                     btnHieght: 35.h,
//                     radius: 16,
//                     btnWidth: ScreenUtil().screenWidth / 2.2,
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       );
//     },
//   );
// }
