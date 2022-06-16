import 'package:flutter/material.dart';
import 'package:moon_store/utils/themes.dart';
import 'package:moon_store/view/widgets/text.dart';

class PaymentMethodsWidget extends StatefulWidget {
  const PaymentMethodsWidget({Key? key}) : super(key: key);

  @override
  State<PaymentMethodsWidget> createState() => _PaymentMethodsWidgetState();
}

class _PaymentMethodsWidgetState extends State<PaymentMethodsWidget> {

  int radioPaymentIndex = 1 ;
  bool ColorsChange = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          RadioPaymentWidget(
            color: ColorsChange ?    Colors.white :  Colors.grey.shade300,
            name: 'Master Card',
            image: 'assets/images/Mastercard.png',
            scale: 1.2,
            value: 1,
            onChange: (int ? index){
              setState((){
                radioPaymentIndex = index!;
                ColorsChange = !ColorsChange;

              });
            }
          ),
          SizedBox(height: 10,),
          RadioPaymentWidget(
              color: ColorsChange ?   Colors.grey.shade300 : Colors.white,
              name: 'Visa Card',
              image: 'assets/images/Visa.png',
              scale: 0.8,
              value: 2,
              onChange: (int ? index){
                setState((){
                  radioPaymentIndex = index!;
                  ColorsChange = !ColorsChange;

                });
              }
          ),

          SizedBox(height: 10,),

        ],
      ),
    );
  }

  Widget RadioPaymentWidget({
    required Color color,
    required String image,
    required String name,
    required double scale,
    required int value ,
    required Function onChange,
  }) {
    return Card(
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3.0,
                blurRadius:0,
              ),

            ]

        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(image, scale: scale,),
                  SizedBox(width: 10,),
                  TextUtils(text: name,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ],
              ),
              Radio(
                  value: value,
                  groupValue: radioPaymentIndex,
                  fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
                  onChanged: (int ? value) {
                    onChange(value);
              })

            ],
          ),
        ),
      ),
    );
  }
}
