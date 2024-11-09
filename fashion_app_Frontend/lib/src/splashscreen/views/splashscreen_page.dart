import 'package:flutter/material.dart';
import '../../../common/utils/kcolors.dart';
import '../../../common/services/storage.dart';
import '../../../common/utils/packages_exports.dart';
import '../../../const/resource.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

 @override
  void initState() {
   _navigator();
    super.initState();
  }

   _navigator() async {
      await Future.delayed(const Duration(milliseconds: 3000),(){
        if(Storage().getBool('firstOpen') == null){
           //Go to the onbording sreen
          GoRouter.of(context).go('/onboarding');
        }else{
          //Go to home
          GoRouter.of(context).go('/home');
        }
      });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kWhite,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(R.ASSETS_IMAGES_SPLASHSCREEN_PNG))
        ),
      ),
    );
  }
}
