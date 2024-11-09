import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/utils/packages_exports.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/back_button.dart';
import 'package:fashion_app/common/widgets/custom_button.dart';
import 'package:fashion_app/common/widgets/email_textfield.dart';
import 'package:fashion_app/src/auth/model/registraton_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../common/widgets/password_field.dart';
import '../contorller/auth_notifier.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  late final TextEditingController _usernameContoller = TextEditingController();
  late final TextEditingController _emailContoller = TextEditingController();
  late final TextEditingController _passwordContoller = TextEditingController();
  final FocusNode _passwordNode = FocusNode();

  @override
  void dispose() {
    _usernameContoller.dispose();
    _emailContoller.dispose();
    _passwordContoller.dispose();
    _passwordNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const AppBackButton(),
        elevation: 0,
      ),
      body: ListView(
        children: [
          SizedBox(height: 160.h,),
          Text(
            "Dbest Fashions",
            textAlign: TextAlign.center,
            style: appStyle(24,Kolors.kPrimary,FontWeight.bold),
          ),
          SizedBox(height: 10.h,),
          Text(
            "Hi, welcome back. You've been missed",
            textAlign: TextAlign.center,
            style: appStyle(14,Kolors.kGray ,FontWeight.normal),
          ),
          SizedBox(height: 25.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                EmailTextField(
                  radius: 25,
                  focusNode: _passwordNode,
                  hintText: "Username",
                  controller: _usernameContoller,
                  prefixIcon: const Icon(CupertinoIcons.profile_circled, size: 20,color: Kolors.kPrimary,),
                  keyboardType: TextInputType.name,
                  onEditingComplete: (){
                    FocusScope.of(context).requestFocus(_passwordNode);
                  }
                ),

                SizedBox(height: 25.h,),

                EmailTextField(
                  radius: 25,
                  focusNode: _passwordNode,
                  hintText: "Email",
                  controller: _emailContoller,
                  prefixIcon: const Icon(CupertinoIcons.mail, size: 20,color: Kolors.kPrimary,),
                  keyboardType: TextInputType.name,
                  onEditingComplete: (){
                    FocusScope.of(context).requestFocus(_passwordNode);
                  }
                ),

                SizedBox(height: 25.h,),

                PasswordField(controller: _passwordContoller, focusNode: _passwordNode, radius: 25,),

                SizedBox(height: 25.h,),
                context.watch<AuthNotifier>().isLoading ?
                const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Kolors.kPrimary,
                    valueColor: AlwaysStoppedAnimation<Color>(Kolors.kWhite),
                  ),
                ) :
                CustomBotton(
                  onTap: (){
                    RegistrationModel model = RegistrationModel(password: _passwordContoller.text, username: _usernameContoller.text, email: _emailContoller.text);
                    String data = RegistrationModelToJson(model);
                    // context.read<AuthNotifier>().registrationFunct(context,data);
                  },
                  text: "S I G N U P",
                  btnWidth: ScreenUtil().screenWidth,
                  btnHieght: 40,
                  radius: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}