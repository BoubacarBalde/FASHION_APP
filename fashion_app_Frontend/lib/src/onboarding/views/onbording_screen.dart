import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/utils/packages_exports.dart';
import 'package:fashion_app/src/onboarding/widgets/welcomw_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import '../controllers/onboarding_notifier.dart';
import '../widgets/onboarding_page_one.dart';
import '../widgets/onboarding_page_two.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: context.read<OnBordingNotifier>().selectedPage
    );
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<OnBordingNotifier>(context);
    return Scaffold(
       body: Stack(
         children: [
           PageView(
             controller: _pageController,
             onPageChanged: (page){
               context.read<OnBordingNotifier>().setSelectedPage = page;
             },
             children: const [
               OnBoardinScreenOne(),
               OnBoardinScreenTwo(),
               WelcomScreen(),
             ],
           ),
           context.watch<OnBordingNotifier>().selectedPage == 2 ? SizedBox.shrink() : Positioned(
             bottom:50.h,
             child: Container(
               padding: EdgeInsets.symmetric(horizontal: 20.w),
               width: ScreenUtil().screenWidth,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   context.watch<OnBordingNotifier>().selectedPage == 0 ? SizedBox.shrink() :
                   GestureDetector(
                     onTap: (){
                       _pageController.animateToPage(
                         context.read<OnBordingNotifier>().selectedPage -1,
                           duration:  const Duration(milliseconds: 200),
                           curve: Curves.easeIn,
                       );
                     },
                     child: const Icon(
                         AntDesign.leftcircleo,
                         color: Kolors.kPrimary,
                         size: 30
                     ),
                   ),

                   SizedBox(
                     width:ScreenUtil().screenWidth*0.7,
                     height: 50.h,
                     child: PageViewDotIndicator(
                       currentItem: context.watch<OnBordingNotifier>().selectedPage,
                       count: 3,
                       unselectedColor: Colors.black26,
                       selectedColor: Kolors.kPrimary,
                       duration: const Duration(milliseconds: 200),
                       onItemClicked: (index){
                         _pageController.animateToPage(index, duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
                       },
                     ),
                   ),

                   GestureDetector(
                     onTap: (){
                       _pageController.animateToPage(
                         context.read<OnBordingNotifier>().selectedPage + 1,
                         duration:  const Duration(milliseconds: 200),
                         curve: Curves.easeIn,
                       );
                     },
                     child: const Icon(
                         AntDesign.rightcircleo,
                         color: Kolors.kPrimary,
                         size: 30
                     ),
                   ),
                 ],
               ),
             )
           ),
         ],
       )
    );
  }
}
