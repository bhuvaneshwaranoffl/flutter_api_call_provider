
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ApiProvider extends ChangeNotifier{
  List getList =[];
  bool loading =false;

  Future <void> getProducts()async{
    loading = true ;
    var url = "https://fakestoreapi.com/products";

    var response = await http.get(Uri.parse(url));
    if(response.statusCode==200){
        getList = jsonDecode(response.body);
        loading = false;
        print(getList.toString());
    }else{
          throw Exception('invalid url');
    }
    notifyListeners();

  }
}