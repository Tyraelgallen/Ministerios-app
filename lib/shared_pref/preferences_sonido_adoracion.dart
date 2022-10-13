import 'package:shared_preferences/shared_preferences.dart';

class PreferencesSonido {
  static late SharedPreferences _prefs;

  static bool _field0 = false;
  static bool _field1 = false;
  static bool _field2 = false;
  static bool _field3 = false;
  static bool _field4 = false;
  static bool _field5 = false;
  static bool _field6 = false;
  static bool _field7 = false;
  static bool _field8 = false;
  static bool _field9 = false;
  static bool _field10 = false;
  static bool _field11 = false;
  static bool _field12 = false;
  static bool _field13 = false;
  static bool _field14 = false;
  static bool _field15 = false;
  static bool _field16 = false;
  static bool _field17 = false;

  static String _ausentename = "";
  static String _tardename = "";

  static String _nombre1 = "";
  static String _nombre2 = "";

  static String _observaciones = "";

  static String get observaciones {
    return _prefs.getString('sonidoobservaciones') ?? _observaciones;
  }

  static set observaciones(String value) {
    _observaciones = value;
    _prefs.setString('sonidoobservaciones', value);
  }

  static String get nombre1 {
    return _prefs.getString('sonidonombre1') ?? _nombre1;
  }

  static set nombre1(String value) {
    _nombre1 = value;
    _prefs.setString('sonidonombre1', value);
  }

  static String get nombre2 {
    return _prefs.getString('sonidonombre2') ?? _nombre2;
  }

  static set nombre2(String value) {
    _nombre2 = value;
    _prefs.setString('sonidonombre2', value);
  }

  static String get ausentename {
    return _prefs.getString('sonidoausentename') ?? _ausentename;
  }

  static set ausentename(String value) {
    _ausentename = value;
    _prefs.setString('sonidoausentename', value);
  }

  static String get tardename {
    return _prefs.getString('sonidotardename') ?? _tardename;
  }

  static set tardename(String value) {
    _tardename = value;
    _prefs.setString('sonidotardename', value);
  }

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get field0 {
    return _prefs.getBool("sonidocampo0") ?? _field0;
  }

  static set field0(bool value) {
    _field0 = value;
    _prefs.setBool("sonidocampo0", value);
  }

  static bool get field1 {
    return _prefs.getBool("sonidocampo1") ?? _field1;
  }

  static set field1(bool value) {
    _field1 = value;
    _prefs.setBool("sonidocampo1", value);
  }

  static bool get field2 {
    return _prefs.getBool("sonidocampo2") ?? _field2;
  }

  static set field2(bool value) {
    _field2 = value;
    _prefs.setBool("sonidocampo2", value);
  }

  static bool get field3 {
    return _prefs.getBool("sonidocampo3") ?? _field3;
  }

  static set field3(bool value) {
    _field3 = value;
    _prefs.setBool("sonidocampo3", value);
  }

  static bool get field4 {
    return _prefs.getBool("sonidocampo4") ?? _field4;
  }

  static set field4(bool value) {
    _field4 = value;
    _prefs.setBool("sonidocampo4", value);
  }

  static bool get field5 {
    return _prefs.getBool("sonidocampo5") ?? _field5;
  }

  static set field5(bool value) {
    _field5 = value;
    _prefs.setBool("sonidocampo5", value);
  }

  static bool get field6 {
    return _prefs.getBool("sonidocampo6") ?? _field6;
  }

  static set field6(bool value) {
    _field6 = value;
    _prefs.setBool("sonidocampo6", value);
  }

  static bool get field7 {
    return _prefs.getBool("sonidocampo7") ?? _field7;
  }

  static set field7(bool value) {
    _field7 = value;
    _prefs.setBool("sonidocampo7", value);
  }

  static bool get field8 {
    return _prefs.getBool("sonidocampo8") ?? _field8;
  }

  static set field8(bool value) {
    _field8 = value;
    _prefs.setBool("sonidocampo8", value);
  }

  static bool get field9 {
    return _prefs.getBool("sonidocampo9") ?? _field9;
  }

  static set field9(bool value) {
    _field9 = value;
    _prefs.setBool("sonidocampo9", value);
  }

  static bool get field10 {
    return _prefs.getBool("sonidocampo10") ?? _field10;
  }

  static set field10(bool value) {
    _field10 = value;
    _prefs.setBool("sonidocampo10", value);
  }

  static bool get field11 {
    return _prefs.getBool("sonidocampo11") ?? _field11;
  }

  static set field11(bool value) {
    _field11 = value;
    _prefs.setBool("sonidocampo11", value);
  }

  static bool get field12 {
    return _prefs.getBool("sonidocampo12") ?? _field12;
  }

  static set field12(bool value) {
    _field12 = value;
    _prefs.setBool("sonidocampo12", value);
  }

  static bool get field13 {
    return _prefs.getBool("sonidocampo13") ?? _field13;
  }

  static set field13(bool value) {
    _field13 = value;
    _prefs.setBool("sonidocampo13", value);
  }

  static bool get field14 {
    return _prefs.getBool("sonidocampo14") ?? _field14;
  }

  static set field14(bool value) {
    _field14 = value;
    _prefs.setBool("sonidocampo14", value);
  }

  static bool get field15 {
    return _prefs.getBool("sonidocampo15") ?? _field15;
  }

  static set field15(bool value) {
    _field15 = value;
    _prefs.setBool("sonidocampo15", value);
  }

  static bool get field16 {
    return _prefs.getBool("sonidocampo16") ?? _field16;
  }

  static set field16(bool value) {
    _field16 = value;
    _prefs.setBool("sonidocampo16", value);
  }

  static bool get field17 {
    return _prefs.getBool("sonidocampo17") ?? _field17;
  }

  static set field17(bool value) {
    _field17 = value;
    _prefs.setBool("sonidocampo17", value);
  }
}

class PreferencesMusicosAdoracion {
  static late SharedPreferences _prefs;

  static bool _field0 = false;
  static bool _field1 = false;
  static bool _field2 = false;
  static bool _field3 = false;
  static bool _field4 = false;
  static bool _field5 = false;
  static bool _field6 = false;
  static bool _field7 = false;
  static bool _field8 = false;
  static bool _field9 = false;
  static bool _field10 = false;
  static bool _field11 = false;
  static bool _field12 = false;
  static bool _field13 = false;
  static bool _field14 = false;
  static bool _field15 = false;
  static bool _field16 = false;
  static bool _field17 = false;

  static String _observaciones = "";
  static String _practica = "";

  static String _tarde = "";
  static String _ausente = "";

  static String _nombre1 = "";
  static String _nombre2 = "";

  static String get observaciones {
    return _prefs.getString('musicosadoracionobservaciones') ?? _observaciones;
  }

  static set observaciones(String value) {
    _observaciones = value;
    _prefs.setString('musicosadoracionobservaciones', value);
  }

  static String get practica {
    return _prefs.getString('musicosadoracionpractica') ?? _practica;
  }

  static set practica(String value) {
    _practica = value;
    _prefs.setString('musicosadoracionpractica', value);
  }

  static String get nombre1 {
    return _prefs.getString('musicosadoracionnombre1') ?? _nombre1;
  }

  static set nombre1(String value) {
    _nombre1 = value;
    _prefs.setString('musicosadoracionnombre1', value);
  }

  static String get nombre2 {
    return _prefs.getString('musicosadoracionnombre2') ?? _nombre2;
  }

  static set nombre2(String value) {
    _nombre2 = value;
    _prefs.setString('musicosadoracionnombre2', value);
  }

  static String get tarde {
    return _prefs.getString('musicosadoraciontarde') ?? _tarde;
  }

  static set tarde(String value) {
    _tarde = value;
    _prefs.setString('musicosadoraciontarde', value);
  }

  static String get ausente {
    return _prefs.getString('musicosadoracionausente') ?? _ausente;
  }

  static set ausente(String value) {
    _ausente = value;
    _prefs.setString('musicosadoracionausente', value);
  }

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get field0 {
    return _prefs.getBool("musicosadoracioncampo0") ?? _field0;
  }

  static set field0(bool value) {
    _field0 = value;
    _prefs.setBool("musicosadoracioncampo0", value);
  }

  static bool get field1 {
    return _prefs.getBool("musicosadoracioncampo1") ?? _field1;
  }

  static set field1(bool value) {
    _field1 = value;
    _prefs.setBool("musicosadoracioncampo1", value);
  }

  static bool get field2 {
    return _prefs.getBool("musicosadoracioncampo2") ?? _field2;
  }

  static set field2(bool value) {
    _field2 = value;
    _prefs.setBool("musicosadoracioncampo2", value);
  }

  static bool get field3 {
    return _prefs.getBool("musicosadoracioncampo3") ?? _field3;
  }

  static set field3(bool value) {
    _field3 = value;
    _prefs.setBool("musicosadoracioncampo3", value);
  }

  static bool get field4 {
    return _prefs.getBool("musicosadoracioncampo4") ?? _field4;
  }

  static set field4(bool value) {
    _field4 = value;
    _prefs.setBool("musicosadoracioncampo4", value);
  }

  static bool get field5 {
    return _prefs.getBool("musicosadoracioncampo5") ?? _field5;
  }

  static set field5(bool value) {
    _field5 = value;
    _prefs.setBool("musicosadoracioncampo5", value);
  }

  static bool get field6 {
    return _prefs.getBool("musicosadoracioncampo6") ?? _field6;
  }

  static set field6(bool value) {
    _field6 = value;
    _prefs.setBool("musicosadoracioncampo6", value);
  }

  static bool get field7 {
    return _prefs.getBool("musicosadoracioncampo7") ?? _field7;
  }

  static set field7(bool value) {
    _field7 = value;
    _prefs.setBool("musicosadoracioncampo7", value);
  }

  static bool get field8 {
    return _prefs.getBool("musicosadoracioncampo8") ?? _field8;
  }

  static set field8(bool value) {
    _field8 = value;
    _prefs.setBool("musicosadoracioncampo8", value);
  }

  static bool get field9 {
    return _prefs.getBool("musicosadoracioncampo9") ?? _field9;
  }

  static set field9(bool value) {
    _field9 = value;
    _prefs.setBool("musicosadoracioncampo9", value);
  }

  static bool get field10 {
    return _prefs.getBool("musicosadoracioncampo10") ?? _field10;
  }

  static set field10(bool value) {
    _field10 = value;
    _prefs.setBool("musicosadoracioncampo10", value);
  }

  static bool get field11 {
    return _prefs.getBool("musicosadoracioncampo11") ?? _field11;
  }

  static set field11(bool value) {
    _field11 = value;
    _prefs.setBool("musicosadoracioncampo11", value);
  }

  static bool get field12 {
    return _prefs.getBool("musicosadoracioncampo12") ?? _field12;
  }

  static set field12(bool value) {
    _field12 = value;
    _prefs.setBool("musicosadoracioncampo12", value);
  }

  static bool get field13 {
    return _prefs.getBool("musicosadoracioncampo13") ?? _field13;
  }

  static set field13(bool value) {
    _field13 = value;
    _prefs.setBool("musicosadoracioncampo13", value);
  }

  static bool get field14 {
    return _prefs.getBool("musicosadoracioncampo14") ?? _field14;
  }

  static set field14(bool value) {
    _field14 = value;
    _prefs.setBool("musicosadoracioncampo14", value);
  }

  static bool get field15 {
    return _prefs.getBool("musicosadoracioncampo15") ?? _field15;
  }

  static set field15(bool value) {
    _field15 = value;
    _prefs.setBool("musicosadoracioncampo15", value);
  }

  static bool get field16 {
    return _prefs.getBool("musicosadoracioncampo16") ?? _field16;
  }

  static set field16(bool value) {
    _field16 = value;
    _prefs.setBool("musicosadoracioncampo16", value);
  }

  static bool get field17 {
    return _prefs.getBool("musicosadoracioncampo17") ?? _field17;
  }

  static set field17(bool value) {
    _field17 = value;
    _prefs.setBool("musicosadoracioncampo17", value);
  }
}

class PreferencesVocesAdoracion {
  static late SharedPreferences _prefs;

  static bool _field0 = false;
  static bool _field1 = false;
  static bool _field2 = false;
  static bool _field3 = false;
  static bool _field4 = false;
  static bool _field5 = false;
  static bool _field6 = false;
  static bool _field7 = false;
  static bool _field8 = false;
  static bool _field9 = false;
  static bool _field10 = false;
  static bool _field11 = false;
  static bool _field12 = false;
  static bool _field13 = false;
  static bool _field14 = false;
  //static bool _field15 = false;
  //static bool _field16 = false;

  static String _observaciones = "";

  static String _tarde = "";
  static String _ausente = "";

  static String _nombre1 = "";
  static String _nombre2 = "";

  static String get observaciones {
    return _prefs.getString('vocesadoracionobservaciones') ?? _observaciones;
  }

  static set observaciones(String value) {
    _observaciones = value;
    _prefs.setString('vocesadoracionobservaciones', value);
  }

  static String get nombre1 {
    return _prefs.getString('vocesadoracionnombre1') ?? _nombre1;
  }

  static set nombre1(String value) {
    _nombre1 = value;
    _prefs.setString('vocesadoracionnombre1', value);
  }

  static String get nombre2 {
    return _prefs.getString('vocesadoracionnombre2') ?? _nombre2;
  }

  static set nombre2(String value) {
    _nombre2 = value;
    _prefs.setString('vocesadoracionnombre2', value);
  }

  static String get tarde {
    return _prefs.getString('vocesadoraciontarde') ?? _tarde;
  }

  static set tarde(String value) {
    _tarde = value;
    _prefs.setString('vocesadoraciontarde', value);
  }

  static String get ausente {
    return _prefs.getString('vocesadoracionausente') ?? _ausente;
  }

  static set ausente(String value) {
    _ausente = value;
    _prefs.setString('vocesadoracionausente', value);
  }

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get field0 {
    return _prefs.getBool("vocesadoracioncampo0") ?? _field0;
  }

  static set field0(bool value) {
    _field0 = value;
    _prefs.setBool("vocesadoracioncampo0", value);
  }

  static bool get field1 {
    return _prefs.getBool("vocesadoracioncampo1") ?? _field1;
  }

  static set field1(bool value) {
    _field1 = value;
    _prefs.setBool("vocesadoracioncampo1", value);
  }

  static bool get field2 {
    return _prefs.getBool("vocesadoracioncampo2") ?? _field2;
  }

  static set field2(bool value) {
    _field2 = value;
    _prefs.setBool("vocesadoracioncampo2", value);
  }

  static bool get field3 {
    return _prefs.getBool("vocesadoracioncampo3") ?? _field3;
  }

  static set field3(bool value) {
    _field3 = value;
    _prefs.setBool("vocesadoracioncampo3", value);
  }

  static bool get field4 {
    return _prefs.getBool("vocesadoracioncampo4") ?? _field4;
  }

  static set field4(bool value) {
    _field4 = value;
    _prefs.setBool("vocesadoracioncampo4", value);
  }

  static bool get field5 {
    return _prefs.getBool("vocesadoracioncampo5") ?? _field5;
  }

  static set field5(bool value) {
    _field5 = value;
    _prefs.setBool("vocesadoracioncampo5", value);
  }

  static bool get field6 {
    return _prefs.getBool("vocesadoracioncampo6") ?? _field6;
  }

  static set field6(bool value) {
    _field6 = value;
    _prefs.setBool("vocesadoracioncampo6", value);
  }

  static bool get field7 {
    return _prefs.getBool("vocesadoracioncampo7") ?? _field7;
  }

  static set field7(bool value) {
    _field7 = value;
    _prefs.setBool("vocesadoracioncampo7", value);
  }

  static bool get field8 {
    return _prefs.getBool("vocesadoracioncampo8") ?? _field8;
  }

  static set field8(bool value) {
    _field8 = value;
    _prefs.setBool("vocesadoracioncampo8", value);
  }

  static bool get field9 {
    return _prefs.getBool("vocesadoracioncampo9") ?? _field9;
  }

  static set field9(bool value) {
    _field9 = value;
    _prefs.setBool("vocesadoracioncampo9", value);
  }

  static bool get field10 {
    return _prefs.getBool("vocesadoracioncampo10") ?? _field10;
  }

  static set field10(bool value) {
    _field10 = value;
    _prefs.setBool("vocesadoracioncampo10", value);
  }

  static bool get field11 {
    return _prefs.getBool("vocesadoracioncampo11") ?? _field11;
  }

  static set field11(bool value) {
    _field11 = value;
    _prefs.setBool("vocesadoracioncampo11", value);
  }

  static bool get field12 {
    return _prefs.getBool("vocesadoracioncampo12") ?? _field12;
  }

  static set field12(bool value) {
    _field12 = value;
    _prefs.setBool("vocesadoracioncampo12", value);
  }

  static bool get field13 {
    return _prefs.getBool("vocesadoracioncampo13") ?? _field13;
  }

  static set field13(bool value) {
    _field13 = value;
    _prefs.setBool("vocesadoracioncampo13", value);
  }

  static bool get field14 {
    return _prefs.getBool("vocesadoracioncampo14") ?? _field14;
  }

  static set field14(bool value) {
    _field14 = value;
    _prefs.setBool("vocesadoracioncampo14", value);
  }
}
