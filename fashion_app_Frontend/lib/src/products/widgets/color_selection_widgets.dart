import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/const/constants.dart';
import 'package:flutter/cupertino.dart';
import '../../../common/utils/kcolors.dart';
import '../../../common/utils/packages_exports.dart';
import '../../../common/widgets/app_style.dart';
import '../controllers/colors_sizes_notifier.dart';
import '../controllers/product_notifier.dart';

class ColorSelectionWidgets extends StatelessWidget {
  const ColorSelectionWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorSizeNotifier>(
        builder: (context,colorSizeNotifier,child){
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(context.read<ProductNotifier>().products!.colors.length, (i){
              String c = context.read<ProductNotifier>().products!.colors[i];
              return GestureDetector(
                onTap: (){
                  colorSizeNotifier.setColor(c);
                },
                child: Container(
                 padding: EdgeInsets.only(right: 20.w, left: 20.w),
                 margin: EdgeInsets.only(right: 20.w,),
                  decoration: BoxDecoration(
                    color: colorSizeNotifier.color == c ? Kolors.kPrimary : Kolors.kGrayLight,
                    borderRadius: kRadiusAll
                  ),
                  child: ReusableText(text: c,style: appStyle(12,Kolors.kWhite,FontWeight.normal),)
                ),
              );
            }),
          );
        }
    );
  }
}
