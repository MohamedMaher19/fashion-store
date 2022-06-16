import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moon_store/model/product_model.dart';
import 'package:moon_store/utils/reg_exp.dart';

 class ProductServices {

  static Future<List<ProductModels>> getAllProducts()async{

     var response=await http.get(Uri.parse('$baseUrl/products'));

     if(response.statusCode==200) {

      var data =response.body;

      return productModelsFromJson(data);

         }else{

       throw Exception('There is an error');
     }

  }


}