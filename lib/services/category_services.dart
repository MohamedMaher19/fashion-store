import 'package:http/http.dart' as http;
import 'package:moon_store/model/category_model.dart';
import 'package:moon_store/model/product_model.dart';
import 'package:moon_store/utils/reg_exp.dart';

class CategoryServices {
  static Future<List<String>> getCategories() async {
    var response = await http.get(Uri.parse('$baseUrl/products/categories'));

    if (response.statusCode == 200) {
      var data = response.body;

      return categoryModelFromJson(data);
    } else {
      throw Exception('There is an error');
    }
  }
}




class AllCategoryProductsServices {

  static Future<List<ProductModels>> getAllCategooryProducts(String categoryName)async{

    var response=await http.get(Uri.parse('$baseUrl/products/category/$categoryName'));

    if(response.statusCode==200) {

      var data =response.body;

      return productModelsFromJson(data);

    }else{

      throw Exception('There is an error');
    }

  }


}
