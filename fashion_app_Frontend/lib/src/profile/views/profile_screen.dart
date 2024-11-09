import 'package:fashion_app/common/services/storage.dart';
import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:fashion_app/common/utils/packages_exports.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/help_bottom_sheet.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/src/auth/contorller/auth_notifier.dart';
import 'package:fashion_app/src/auth/model/profile_model.dart';
import 'package:fashion_app/src/entrypoint/controlleurs/botton_tab_notifier.dart';
import 'package:fashion_app/src/profile/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../../common/widgets/custom_button.dart';
import '../../auth/views/login_screen.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    String? accesToken = Storage().getString('accesToken');

    if(accesToken == null){
      return const LoginPage();
    }

    return Scaffold(
      body: Consumer<AuthNotifier>(
        builder: (context, authNotifier, child){
          // ProfielModel? user = authNotifier.getUserData();
          return ListView(
            children: [
              Column(
                children: [
                  const SizedBox(
                      height: 30.0
                  ),
                  const CircleAvatar(
                    radius: 35,
                    backgroundColor: Kolors.kOffWhite,
                    backgroundImage: NetworkImage(AppText.kProfilePic) ,
                  ),
                  const SizedBox(
                      height: 15.0
                  ),
                  ReusableText(text: "ttre", style: appStyle(11,Kolors.kGray,FontWeight.w600 ),),
                  const SizedBox(
                      height: 7.0
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.h),
                    decoration: BoxDecoration(
                      color: Kolors.kOffWhite,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ReusableText(text: "uyyutuy",style: appStyle(14,Kolors.kDark,FontWeight.w600 ),),
                  )
                ],
              ),

              SizedBox(height: 30.h),

              Container(
                color: Kolors.kOffWhite,
                child: Column(
                  children: [
                    ProfileTitleWidget(
                      title: 'My Orders',
                      leading: Octicons.checklist,
                      onTap: (){
                        context.push('/orders');
                      },
                    ),

                    ProfileTitleWidget(
                      title: 'Shopping Adress',
                      leading: MaterialIcons.location_pin,
                      onTap: (){
                        context.push('/shoppingAddress');
                      },
                    ),

                    ProfileTitleWidget(
                      title: 'Privacy Policy',
                      leading: MaterialIcons.policy,
                      onTap: (){
                        context.push('/policy');
                      },
                    ),

                    ProfileTitleWidget(
                      title: 'Help Center',
                      leading: AntDesign.customerservice,
                      onTap: ()=> showHelpCenterBottomSheet(context),
                    )
                  ],
                ),
              ),

              SizedBox(height: 30.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: CustomBotton(
                  text: "Logout".toUpperCase(),
                  btnColor: Kolors.kRed,
                  btnHieght: 35,
                  btnWidth: ScreenUtil().screenWidth,
                  onTap: (){
                    Storage().removeKey('accesToken');
                    context.read<TabIndexNotified>().setIndex(0);
                    context.go('/home');
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
