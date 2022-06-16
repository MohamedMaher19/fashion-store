abstract class PaymentStates{}

class PaymentInitialState extends PaymentStates{}


class PaymentSuccessState extends PaymentStates{}
class PaymentErrorState extends PaymentStates{

  String error;
  PaymentErrorState(this.error);
}

class PaymenOrderIdSuccessState extends PaymentStates{}
class PaymenOrderIdErrorState extends PaymentStates{

  String error;
  PaymenOrderIdErrorState(this.error);
}


class PaymenRequestTokenSuccessState extends PaymentStates{}
class PaymenRequestTokenErrorState extends PaymentStates{

  String error;
  PaymenRequestTokenErrorState(this.error);
}

class PaymenRequestTokenKioskSuccessState extends PaymentStates{}
class PaymenRequestTokenkioskErrorState extends PaymentStates{

  String error;
  PaymenRequestTokenkioskErrorState(this.error);
}

class RefCodeKioskSuccessState extends PaymentStates{}
class RefCodekioskErrorState extends PaymentStates{

  String error;
  RefCodekioskErrorState(this.error);
}