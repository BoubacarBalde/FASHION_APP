import 'package:fashion_app/src/products/model/products_model.dart';
import 'package:flutter/cupertino.dart';

class ProductNotifier with ChangeNotifier{
  Products? products;

  void setProduct(Products p){
    products = p;
    notifyListeners();
  }

  bool _description = false;

  bool get description => _description;

  void setDescription(){
    _description = !_description;
    notifyListeners();
  }

  void resetDescription(){
    _description = false;
  }

}