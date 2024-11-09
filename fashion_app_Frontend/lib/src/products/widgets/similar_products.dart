import 'package:fashion_app/common/services/storage.dart';
import 'package:fashion_app/common/utils/packages_exports.dart';
import 'package:fashion_app/common/widgets/login_bottom_sheet.dart';
import 'package:fashion_app/const/constants.dart';
import 'package:fashion_app/src/products/widgets/staggered_title_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SimularProducts extends StatelessWidget {
  const SimularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    String? accessToken = Storage().getString('accessToke');
    return Padding(
      padding: EdgeInsets.all(8.h),
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        children: List.generate(products.length, (i){
          final double mainAxisCellCount = (i % 2 == 0 ? 2.17 : 2.4);
          final product = products[i];
          return StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: mainAxisCellCount,
            child: StaggeredTitleWidget(
              i:i,
              product: product,
              onTap: (){
                if(accessToken == null){
                  loginBottomSheet(context);
                }else{

                }
              },
            )
          );
        }),
      )
    );
  }
}
