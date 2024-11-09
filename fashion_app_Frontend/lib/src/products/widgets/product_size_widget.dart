import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/src/products/controllers/colors_sizes_notifier.dart';
import 'package:fashion_app/src/products/controllers/product_notifier.dart';
import 'package:flutter/cupertino.dart';
import '../../../common/utils/packages_exports.dart';

class ProductSizeWidget extends StatelessWidget {
  const ProductSizeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorSizeNotifier>(
      builder: (context,colorSizeNotifier,child){
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(context.read<ProductNotifier>().products!.sizes.length, (i){
            String s = context.read<ProductNotifier>().products!.sizes[i];
            return GestureDetector(
              onTap: (){
                colorSizeNotifier.setSizes(s);
              },
              child: Container(
                width: 45.h,
                height: 30.h,
                decoration: BoxDecoration(
                  color: colorSizeNotifier.sizes == s ? Kolors.kPrimary : Kolors.kGrayLight,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(s,style: appStyle(20, Kolors.kWhite, FontWeight.bold),)
                ),
              ),
            );
          }),
        );
      }
    );
  }
}
