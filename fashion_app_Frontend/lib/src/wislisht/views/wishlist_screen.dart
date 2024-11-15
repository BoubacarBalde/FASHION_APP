import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/src/products/widgets/explore_products.dart';
import 'package:fashion_app/common/services/storage.dart';
import 'package:flutter/material.dart';

import '../../auth/views/login_screen.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({super.key});

  @override
  Widget build(BuildContext context) {

    String? accesToken = Storage().getString('accesToken');

    if(accesToken == null){
      return const LoginPage();
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: ReusableText(text: AppText.kWishlist,style: appStyle(16,Kolors.kPrimary,FontWeight.bold)),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ExploreProducts(),
      )
    );
  }
}
