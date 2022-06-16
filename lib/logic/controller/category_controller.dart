import 'package:get/get.dart';
import 'package:moon_store/model/product_model.dart';
import 'package:moon_store/services/category_services.dart';

class CategoryController extends GetxController{

var categoryNamesList = [].obs;
RxBool isCategoryLoading = false.obs;
RxBool isCategoryProductsLoading = false.obs;

var categryProductsList = <ProductModels>[].obs;

List<String> categoryImages = [
  'https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_.jpg',
  'https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg',
  'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg',
  'https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg',
];

@override
void onInit(){
  super.onInit();
  getCategories ();
}

///////////////////////////////////////////////////////////// get categories

void getCategories () async{

  var categoryName = await CategoryServices.getCategories();
  try{
    isCategoryLoading(true);
    if(categoryName.isNotEmpty){
      categoryNamesList.addAll(categoryName);
    }
  }finally{
    isCategoryLoading(false);
  }
}

////////////////////////////////////////////////////////////////////////////////// get products in categories

 getAllCategoriesProducts (String categoriesName) async {
  isCategoryProductsLoading(true);

  categryProductsList.value =
  await AllCategoryProductsServices.getAllCategooryProducts(categoriesName);

  isCategoryProductsLoading(false);
}

// عملنا الفانكشن ال تحت دي عشان نعمل تاخير لما ندوس علي الكارد عشان المنتجات تلحق تتبدل علي حسب المنتج وميحصلش التغيير دا قدام اليوزر

  // getCategoryProductsIndex (int index)async {
  //
  // var categoryNames = await getAllCategoriesProducts(categoryNamesList[index]);
  //
  // if(categoryNames != null){
  //   categryProductsList.value = categoryNames;
  // }
  //   }

}