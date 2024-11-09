import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/utils/packages_exports.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/back_button.dart';
import 'package:fashion_app/common/widgets/custom_button.dart';
import 'package:fashion_app/common/widgets/email_textfield.dart';
import 'package:fashion_app/src/auth/contorller/auth_notifier.dart';
import 'package:fashion_app/src/auth/model/login_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../common/widgets/password_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late final TextEditingController _usernameContoller = TextEditingController();
  late final TextEditingController _passwordContoller = TextEditingController();
  final FocusNode _passwordNode = FocusNode();

  @override
  void dispose() {
    _usernameContoller.dispose();
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
        leading: AppBackButton(
          onTap: (){
            context.go('/home');
          },
        ),
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
            "Hi, welcom back. You've been missed",
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
                    LoginModel model = LoginModel(username: _usernameContoller.text, password: _passwordContoller.text);
                    String data = loginModelToJson(model);
                    context.read<AuthNotifier>().LoginFuc(context, data);
                  },
                  text: "L O G I N",
                  btnWidth: ScreenUtil().screenWidth,
                  btnHieght: 40,
                  radius: 20,
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 130.h,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 110.0),
            child: GestureDetector(
              onTap: (){
                context.push('/register');
              },
              child: Text(
                "Do not have an account? Register a new  one",
                style: appStyle(12, Colors.blue,FontWeight.normal),
              ),
            ),
          ),
        ),
      )
    );
  }
}
