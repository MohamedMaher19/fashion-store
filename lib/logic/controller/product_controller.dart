import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:moon_store/model/product_model.dart';
import 'package:moon_store/services/product_services.dart';

class ProductController extends GetxController{

  var productList =<ProductModels> [].obs;

  var favoritesList =<ProductModels> [].obs;

  var isLoading = true.obs; // to controler Circular progress indicator

  var storage = GetStorage();

  // search
  var searchList = <ProductModels>[].obs;
  TextEditingController searchController = TextEditingController();


  @override
  void onInit(){
    super.onInit();

    List? storedFavorites = storage.read<List>('isFavorite');
    if (storedFavorites != null) {
      favoritesList =
          storedFavorites.map((e) => ProductModels.fromJson(e)).toList().obs;
    }


    getProducts();
  }

  // get product function
  void getProducts() async{

   var products  = await ProductServices.getAllProducts();

    try{
      isLoading.value = true; // to controler Circular progress indicator

      if(products.isNotEmpty){
        productList.addAll(products);

      }

    }finally{
      isLoading.value= false; // to controler Circular progress indicator
    }
  }


  /////////////////////////////////////////////////////////////////////////////

  // logic to add & delete  product from favorite screen

void manageFavorites(int productId) async{

    // to delete items from favorite screen when press on heart

  var existingIndex = favoritesList.indexWhere((element) => element.id == productId);

  if (existingIndex >= 0){
    favoritesList.removeAt(existingIndex);
    await storage.remove('isFavorite');
  }else{

  // to add items to fav screen

    favoritesList.add( productList.firstWhere((element) => element.id == productId) ,
    );
   await storage.write('isFavorite' , favoritesList);
}
  }

  bool isFavorited(int productId){

    return favoritesList.any((element) => element.id == productId);

  }
  //////////////////////////////////////////////////////////////////////////////////////
// logic for serach bar

  void addSearchProductToList(String searchName){

    searchName = searchName.toLowerCase();

    searchList.value = productList.where((search) {

      var searchTitle =search.title.toLowerCase();
      var searchPrice =search.price.toString().toLowerCase();

      return searchTitle.contains(searchName) || searchPrice.toString().contains(searchName) ;
    } ).toList();
    update();
  }

  void clearSearchBar(){
    searchController.clear();
    addSearchProductToList('');



  }

}