import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_store/logic/controller/cart_controller.dart';
import 'package:moon_store/routes/routes.dart';
import 'package:moon_store/utils/themes.dart';
import 'package:moon_store/view/widgets/product_details_widgets/color_picker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatefulWidget {
   ImageSlider({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {

  CarouselController carouselController = CarouselController();
   int currentPage = 0;
   int currentColor = 0;
  final List <Color> chosedColor= [
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,
    kCOlor3,

  ] ;

  final cartController = Get.find<CartController>();


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          carouselController:carouselController ,
            itemCount: 3,
            options: CarouselOptions(
              height: 400,
              autoPlay: true,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              autoPlayAnimationDuration: Duration(seconds: 2),
              viewportFraction: 1,
              onPageChanged: (index , reason){
                setState((){
                  currentPage = index;
                });
              }
            ),
          itemBuilder: (context ,index ,realIndex ){
            return Container(
              margin: EdgeInsets.all(15),
              decoration:BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.imageUrl),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(30),
              ) ,
            );

          },

        ),
        Positioned(
          bottom: 20,
            left: 160,
            child: AnimatedSmoothIndicator(
          activeIndex:currentPage,
              count: 3 ,
              effect: ExpandingDotsEffect(
                dotColor: Get.isDarkMode ? Colors.black : Colors.grey,
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: Get.isDarkMode ? pinkClr : mainColor,
              ),

        ),),
        Positioned(
          bottom: 50,
            right: 30,
            child:Container(
              height: 200,
              width: 50,
              padding: EdgeInsets.all(8 ),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(30),
              ),
              child: ListView.separated(
                  itemBuilder:(context , index){
                    return InkWell(
                      onTap: (){
                        setState((){
                          currentColor = index;
                        });
                      },
                        child: ColorPiker(outBorder: currentColor == index, color: chosedColor[index]));
                  } ,
                  separatorBuilder: (context , index) => SizedBox(height: 3,),
                  itemCount: chosedColor.length),

            ) ,
        ),
        Container(
          // color: Colors.grey,
          padding: EdgeInsets.only(top: 25 , left: 30 , right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color:Get.isDarkMode ? pinkClr.withOpacity(0.8) : mainColor.withOpacity(0.8),
                    shape: BoxShape.circle,

                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(Icons.arrow_back_ios , color: Get.isDarkMode ? Colors.white : Colors.white,size: 22,),

                  ),

                ),
              ),
              Obx(() => Badge(
                position: BadgePosition.topEnd(top: -10, end: -3),
                animationDuration: Duration(milliseconds: 300),
                animationType: BadgeAnimationType.slide,
                badgeContent: Text(
                  cartController.bageQuantity().toString() ,
                  style: TextStyle(color: Colors.white),
                ),
                child: InkWell(
                  onTap: (){
                    Get.toNamed(Routes.cartScreen);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color:Get.isDarkMode ? pinkClr.withOpacity(0.8) : mainColor.withOpacity(0.8),
                      shape: BoxShape.circle,

                    ),
                    child: Icon(Icons.shopping_cart_outlined , color: Get.isDarkMode ? Colors.white : Colors.white,size: 22,),

                  ),
                ),
              ),)

            ],
          ),
        )



      ],
    );
  }
}
