import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/utils/packages_exports.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/src/cart/views/cart_screen.dart';
import 'package:fashion_app/src/entrypoint/controlleurs/botton_tab_notifier.dart';
import 'package:fashion_app/src/home/views/home_screen.dart';
import 'package:fashion_app/src/profile/views/profile_screen.dart';
import 'package:fashion_app/src/wislisht/views/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class AppEntryPoint extends StatelessWidget {
  AppEntryPoint({super.key});

  List<Widget> pageList = [
    const HomePage(),
    const WishListPage(),
    const CartPages(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabIndexNotified>(
      builder: (context, tabindexnotifier, child){
        return Scaffold(
          body: Stack(
            children: [
              pageList[tabindexnotifier.index],
              Align(
                alignment: Alignment.bottomRight,
                child: Theme(
                  data: Theme.of(context).copyWith(canvasColor: Kolors.kOffWhite),
                  child: BottomNavigationBar(
                    selectedFontSize: 12,
                    elevation: 0,
                    backgroundColor: Kolors.kOffWhite,
                    showSelectedLabels: true,
                    selectedLabelStyle: appStyle(12, Kolors.kPrimary, FontWeight.w500),
                    showUnselectedLabels: false,
                    currentIndex: tabindexnotifier.index,
                    selectedItemColor: Kolors.kPrimary,
                    unselectedItemColor: Kolors.kGray,
                    unselectedIconTheme: const IconThemeData(color: Colors.black38),
                    onTap: (i){
                      tabindexnotifier.setIndex(i);
                    },
                    items: [
                      BottomNavigationBarItem(
                          icon: tabindexnotifier.index == 0 ? const Icon(AntDesign.home,color: Kolors.kPrimary,size: 24,) : const Icon(AntDesign.home,size: 24,) ,
                          label: "Home"
                      ),
                      BottomNavigationBarItem(
                          icon: tabindexnotifier.index == 1 ? const Icon(Ionicons.heart,color: Kolors.kPrimary,size: 24,) : const Icon(Ionicons.heart_outline,size: 24,),
                          label: "Wishlit"
                      ),
                      BottomNavigationBarItem(
                          icon: tabindexnotifier.index == 2
                              ? const Badge(
                                   label: Text('9'),
                                   child: Icon(MaterialCommunityIcons.shopping,color: Kolors.kPrimary,size: 24,))
                              : const Badge(
                                   label: Text('9'),
                                   child: Icon(MaterialCommunityIcons.shopping_outline,size: 24,)),
                          label: "Cart"
                      ),
                      BottomNavigationBarItem(
                          icon: tabindexnotifier.index == 3 ? const Icon(EvilIcons.user,color: Kolors.kPrimary,size: 34,) : const Icon(EvilIcons.user,size: 34,),
                          label: "Profile"
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
