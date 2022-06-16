import 'package:get/get.dart';
import 'package:moon_store/language/arabic.dart';
import 'package:moon_store/language/english.dart';
import 'package:moon_store/language/france.dart';
import 'package:moon_store/utils/reg_exp.dart';

class Localization extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys =>{

    ene : en ,
    ara : ar ,
    frf : fr ,

  } ;


}

// we add code at the main screen dont forget it :)
// and add code at setting controller