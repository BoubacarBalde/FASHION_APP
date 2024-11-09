import 'dart:convert';
import 'package:fashion_app/common/services/storage.dart';
import 'package:fashion_app/common/utils/environment.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:fashion_app/common/utils/packages_exports.dart';
import 'package:fashion_app/common/widgets/error_modal.dart';
import 'package:fashion_app/src/auth/model/auth_token_model.dart';
import 'package:fashion_app/src/entrypoint/controlleurs/botton_tab_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/profile_model.dart';


class AuthNotifier with ChangeNotifier{
  bool _isLoaing = false;

  bool get isLoading => _isLoaing;

  void setIsLoading(){
    _isLoaing = !_isLoaing;
    notifyListeners();
  }

  void LoginFuc(BuildContext ctx, String data) async {
    setIsLoading();

    try{
      var url = Uri.parse('${Environment.appBaseUrl}/auth/token/login/');

      var response = await http.post(url, headers: {
        'Content-Type':'application/json',
      },body: data);

      if(response.statusCode == 200){
        String accesToken = AccesTokenModelFromJson(response.body).authToken;
        Storage().setString('accesToken', accesToken);
        getUser(ctx, accesToken);
        setIsLoading();
      }

    }catch(e){
     setIsLoading();
     showErrorPopup(ctx, AppText.kErrorLogin,null, null);
    }
  }

  void registrationFunct(BuildContext ctx, String data) async{
    setIsLoading();

    try{
      var url = Uri.parse('${Environment.appBaseUrl}/auth/users/');

      var response = await http.post(url, headers: {
        'Content-Type':'application/json',
      },body: data);

      if(response.statusCode == 201){
        setIsLoading();
      }else if(response.statusCode == 400){
        var data = jsonDecode(response.body);
        showErrorPopup(ctx, data['password'][0],null, null);
      }
    }catch(e){
      setIsLoading();
      showErrorPopup(ctx, AppText.kErrorLogin,null, null);
    }
  }

  void getUser(BuildContext ctx,String accesToken) async {

    try{
      var url = Uri.parse('${Environment.appBaseUrl}/auth/users/me/');

      var response = await http.get(url, headers: {
        'Authorization': 'Token $accesToken',
        'Content-Type':'application/json'
      });

      if(response.statusCode == 200){
        Storage().setString('accesToken', accesToken);
        Storage().setString(accesToken, response.body);
        ctx.read<TabIndexNotified>().setIndex(0);
        ctx.go('/home');
      }

    }catch(e){
      setIsLoading();
      showErrorPopup(ctx, AppText.kErrorLogin,null, null);
    }
  }

  ProfielModel? getUserData() {
    String? accesToken = Storage().getString('accesToken');

    if(accesToken != null){
      var data = Storage().getString('accesToken');
      if(data != null){
        return profielModelFromJson(data);
      }
    }

  }
}