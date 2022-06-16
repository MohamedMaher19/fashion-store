import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moon_store/logic/payment_logic/payment_state.dart';
import 'package:moon_store/model/payment_models/first_token.dart';
import 'package:moon_store/services/dio_payment_services.dart';
import 'package:moon_store/utils/constants.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(PaymentInitialState());

  static PaymentCubit get(context) => BlocProvider.of(context);

  FirstToken? firstToken;

  Future getFirstToken(String price , String firstName ,String lastName , String email , String phone) async {
    DioHelperPayment.postData(
        url: 'auth/tokens', data: {'api_key': paymobApiKey}).then((value) {
      paymobToken = value.data['token'];
      print('first token : ${paymobToken}');

      getOrderId(price , firstName , lastName , email , phone);
      emit(PaymentSuccessState());
    }).catchError((error) {
      emit(PaymentErrorState(error));
    });
  }

  Future getOrderId(String price , String firstName ,String lastName , String email , String phone) async {
    DioHelperPayment.postData(url: 'ecommerce/orders', data: {
      'auth_token': paymobToken,
      'delivery_needed	': 'false',
      'amount_cents': price,
      "currency": "EGP",
      'items': [],
    }).then((value) {
      payMoborderId = value.data['id'].toString();
      print('orderId : ${payMoborderId}');
      getFinalTokenCard(price , firstName , lastName , email , phone);
      getFinalTokenKiosk(price , firstName , lastName , email , phone);
      emit(PaymenOrderIdSuccessState());
    }).catchError((error) {
      emit(PaymenOrderIdErrorState(error));
    });
  }

  Future getFinalTokenCard(String price , String firstName ,String lastName , String email , String phone ) async {
    DioHelperPayment.postData(url: 'acceptance/payment_keys', data: {
      "auth_token": paymobToken,
      "amount_cents": price,
      "expiration": 3600,
      "order_id": payMoborderId,
      "billing_data": {
        "apartment": "NA",
        "email": email,
        "floor": "NA",
        "first_name": firstName,
        "street": "NA",
        "building": "NA",
        "phone_number":phone,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "last_name": lastName,
        "state": "NA"
      },
      "currency": "EGP",
      "integration_id": integrationIdCard,
      "lock_order_when_paid": "false"
    }).then((value) {
      payMobfinalTokenCard = value.data['token'].toString();
      print('Final Token Card : ${payMobfinalTokenCard}');

      emit(PaymenRequestTokenSuccessState());
    }).catchError((error) {
      emit(PaymenRequestTokenErrorState(error));
    });
  }

  Future getFinalTokenKiosk(String price , String firstName ,String lastName , String email , String phone ) async {
    DioHelperPayment.postData(url: 'acceptance/payment_keys', data: {
      "auth_token": paymobToken,
      "amount_cents": price,
      "expiration": 3600,
      "order_id": payMoborderId,
      "billing_data": {
        "apartment": "NA",
        "email": email,
        "floor": "NA",
        "first_name": firstName,
        "street": "NA",
        "building": "NA",
        "phone_number":phone,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "last_name": lastName,
        "state": "NA"
      },
      "currency": "EGP",
      "integration_id": integrationIdKiosk,
      "lock_order_when_paid": "false"
    }).then((value) {
      payMobfinalTokenKisok = value.data['token'].toString();
      print('Final Token kisok : ${payMobfinalTokenKisok}');
      getRefernceCode();
      emit(PaymenRequestTokenKioskSuccessState());
    }).catchError((error) {
      emit(PaymenRequestTokenkioskErrorState(error));
    });
  }

  Future getRefernceCode() async {
    DioHelperPayment.postData(url: 'acceptance/payments/pay', data: {

        "source": {
          "identifier": "AGGREGATOR",
          "subtype": "AGGREGATOR"
        },
        "payment_token": payMobfinalTokenKisok


    }).then((value) {
      RefCode = value.data['id'].toString();
      print('RefCode : ${RefCode}');
      emit(RefCodeKioskSuccessState());
    }).catchError((error) {
      emit(RefCodekioskErrorState(error));
    });
  }


}
