import 'package:flutter/material.dart';
import 'package:fashion_app/common/services/storage.dart';

import '../../auth/views/login_screen.dart';


class CartPages extends StatelessWidget {
  const CartPages({super.key});

  @override
  Widget build(BuildContext context) {

    String? accesToken = Storage().getString('accesToken');

    if(accesToken == null){
      return const LoginPage();
    }
    return Scaffold(
      body: Center(
        child: Text('Cart Page'),
      ),
    );
  }
}
