import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashion_app/common/services/storage.dart';
import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:fashion_app/common/utils/packages_exports.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/back_button.dart';
import 'package:fashion_app/common/widgets/error_modal.dart';
import 'package:fashion_app/common/widgets/login_bottom_sheet.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/src/products/controllers/product_notifier.dart';
import 'package:fashion_app/src/products/widgets/color_selection_widgets.dart';
import 'package:fashion_app/src/products/widgets/expendable_text.dart';
import 'package:fashion_app/src/products/widgets/product_size_widget.dart';
import 'package:fashion_app/src/products/widgets/similar_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../../const/constants.dart';
import '../controllers/colors_sizes_notifier.dart';
import '../widgets/product_button_bart.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {

    String? accesToken = Storage().getString('accessToken');

    return Consumer<ProductNotifier>(
      builder: (context, productnotifier, child){
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              //TODO En tete
              SliverAppBar(
                backgroundColor: Colors.white,
                expandedHeight: 320.h,
                collapsedHeight: 65.h,
                floating: false,
                pinned: true,
                leading: const AppBackButton(),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: GestureDetector(
                      onTap: (){},
                      child: const CircleAvatar(
                        backgroundColor: Kolors.kSecondaryLight,
                        child: Icon(AntDesign.heart,color: Kolors.kRed,size:18) ,
                      ),
                    ),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  background: SizedBox(
                    height: 415.h,
                    child: ImageSlideshow(
                      indicatorColor: Kolors.kPrimaryLight,
                      autoPlayInterval: 5000,
                      isLoop: productnotifier.products!.imageUrls.length > 1 ? true : false,
                      children: List.generate(productnotifier.products!.imageUrls.length, (i){
                        return CachedNetworkImage(
                          placeholder: placeholder,
                          errorWidget: errorWidget,
                          imageUrl: productnotifier.products!.imageUrls[i],
                          fit: BoxFit.cover,
                        );
                      }),
                    ),
                  ),
                ),
              ),
              //TODO: body
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 10.h,
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableText(
                        text: productnotifier.products!.clothesType.toUpperCase(),
                        style: appStyle(13,Kolors.kGray,FontWeight.w600)
                      ),
                      Row(
                        children: [
                          const Icon(AntDesign.star,color: Kolors.kGold,size: 14,),
                          SizedBox(width: 5.w),
                          ReusableText(
                            text: productnotifier.products!.ratings.toStringAsFixed(1),
                            style: appStyle(13,Kolors.kGray, FontWeight.normal),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.h),
                  child:  ReusableText(
                    text: productnotifier.products!.title,
                    style: appStyle(13,Kolors.kDark, FontWeight.bold),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.h),
                  child:  ExpandableText(text: productnotifier.products!.description,)
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.h),
                    child: Divider(
                      thickness: .5.h,
                    )
                ),
              ),

              SliverToBoxAdapter(
                child: SizedBox(
                  height: 10.h,
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.h),
                  child: ReusableText(text: "Select Sizes",style: appStyle(14, Kolors.kDark, FontWeight.w600)),
                )
              ),

              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ProductSizeWidget(),
                ),
              ),

              SliverToBoxAdapter(
                child: SizedBox(
                  height: 10.h,
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.h),
                  child: ReusableText(text: "Select Color",style: appStyle(14, Kolors.kDark, FontWeight.w600)),
                )
              ),

              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ColorSelectionWidgets(),
                ),
              ),

              SliverToBoxAdapter(
                child: SizedBox(
                  height: 10.h,
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.h),
                  child: ReusableText(text: "Simular Products",style: appStyle(14, Kolors.kDark, FontWeight.w600)),
                )
              ),

              const SliverToBoxAdapter(
                child: SimularProducts()
              ),
            ],
          ),
          bottomNavigationBar: ProductBottonBar(
            price: productnotifier.products!.price.toStringAsFixed(2),
            onPressed: () {
              if (accesToken == null) {
                loginBottomSheet(context);
              }else {
                if(context.read<ColorSizeNotifier>().color == '' || context.read<ColorSizeNotifier>().sizes == ''){
                  showErrorPopup(context, AppText.kCardErrorText, "Error Adding to Card", true);
                }else{
                  //TODO:CART LOGIN
                }
              }
            }

          ),
        );
      }
    );
  }
}
