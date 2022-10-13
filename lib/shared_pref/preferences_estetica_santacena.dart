import 'package:shared_preferences/shared_preferences.dart';

class PreferencesEstetica {
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

  static String _observaciones = "";

  static String _nombre1 = "";

  static String get observaciones {
    return _prefs.getString('esteticaobservaciones') ?? _observaciones;
  }

  static set observaciones(String value) {
    _observaciones = value;
    _prefs.setString('esteticaobservaciones', value);
  }

  static String get nombre1 {
    return _prefs.getString('esteticanombre1') ?? _nombre1;
  }

  static set nombre1(String value) {
    _nombre1 = value;
    _prefs.setString('esteticanombre1', value);
  }

  static String get ausentename {
    return _prefs.getString('esteticaausentename') ?? _ausentename;
  }

  static set ausentename(String value) {
    _ausentename = value;
    _prefs.setString('esteticaausentename', value);
  }

  static String get tardename {
    return _prefs.getString('esteticatardename') ?? _tardename;
  }

  static set tardename(String value) {
    _tardename = value;
    _prefs.setString('esteticatardename', value);
  }

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get field0 {
    return _prefs.getBool("esteticacampo0") ?? _field0;
  }

  static set field0(bool value) {
    _field0 = value;
    _prefs.setBool("esteticacampo0", value);
  }

  static bool get field1 {
    return _prefs.getBool("esteticacampo1") ?? _field1;
  }

  static set field1(bool value) {
    _field1 = value;
    _prefs.setBool("esteticacampo1", value);
  }

  static bool get field2 {
    return _prefs.getBool("esteticacampo2") ?? _field2;
  }

  static set field2(bool value) {
    _field2 = value;
    _prefs.setBool("esteticacampo2", value);
  }

  static bool get field3 {
    return _prefs.getBool("esteticacampo3") ?? _field3;
  }

  static set field3(bool value) {
    _field3 = value;
    _prefs.setBool("esteticacampo3", value);
  }

  static bool get field4 {
    return _prefs.getBool("esteticacampo4") ?? _field4;
  }

  static set field4(bool value) {
    _field4 = value;
    _prefs.setBool("esteticacampo4", value);
  }

  static bool get field5 {
    return _prefs.getBool("esteticacampo5") ?? _field5;
  }

  static set field5(bool value) {
    _field5 = value;
    _prefs.setBool("esteticacampo5", value);
  }

  static bool get field6 {
    return _prefs.getBool("esteticacampo6") ?? _field6;
  }

  static set field6(bool value) {
    _field6 = value;
    _prefs.setBool("esteticacampo6", value);
  }

  static bool get field7 {
    return _prefs.getBool("esteticacampo7") ?? _field7;
  }

  static set field7(bool value) {
    _field7 = value;
    _prefs.setBool("esteticacampo7", value);
  }

  static bool get field8 {
    return _prefs.getBool("esteticacampo8") ?? _field8;
  }

  static set field8(bool value) {
    _field8 = value;
    _prefs.setBool("esteticacampo8", value);
  }

  static bool get field9 {
    return _prefs.getBool("esteticacampo9") ?? _field9;
  }

  static set field9(bool value) {
    _field9 = value;
    _prefs.setBool("esteticacampo9", value);
  }

  static bool get field10 {
    return _prefs.getBool("esteticacampo10") ?? _field10;
  }

  static set field10(bool value) {
    _field10 = value;
    _prefs.setBool("esteticacampo10", value);
  }

  static bool get field11 {
    return _prefs.getBool("esteticacampo11") ?? _field11;
  }

  static set field11(bool value) {
    _field11 = value;
    _prefs.setBool("esteticacampo11", value);
  }

  static bool get field12 {
    return _prefs.getBool("esteticacampo12") ?? _field12;
  }

  static set field12(bool value) {
    _field12 = value;
    _prefs.setBool("esteticacampo12", value);
  }

  static bool get field13 {
    return _prefs.getBool("esteticacampo13") ?? _field13;
  }

  static set field13(bool value) {
    _field13 = value;
    _prefs.setBool("esteticacampo13", value);
  }

  static bool get field14 {
    return _prefs.getBool("esteticacampo14") ?? _field14;
  }

  static set field14(bool value) {
    _field14 = value;
    _prefs.setBool("esteticacampo14", value);
  }

  static bool get field15 {
    return _prefs.getBool("esteticacampo15") ?? _field15;
  }

  static set field15(bool value) {
    _field15 = value;
    _prefs.setBool("esteticacampo15", value);
  }

  static bool get field16 {
    return _prefs.getBool("esteticacampo16") ?? _field16;
  }

  static set field16(bool value) {
    _field16 = value;
    _prefs.setBool("esteticacampo16", value);
  }

  static bool get field17 {
    return _prefs.getBool("esteticacampo17") ?? _field17;
  }

  static set field17(bool value) {
    _field17 = value;
    _prefs.setBool("esteticacampo17", value);
  }
}

class PreferencesSantaCena {
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

  static String _observaciones = "";

  static String _nombre1 = "";
  static String _nombre2 = "";
  static String _nombre3 = "";
  static String _nombre4 = "";
  static String _nombre5 = "";

  static String get nombre2 {
    return _prefs.getString('santacenanombre2') ?? _nombre2;
  }

  static set nombre2(String value) {
    _nombre2 = value;
    _prefs.setString('santacenanombre2', value);
  }

  static String get nombre3 {
    return _prefs.getString('santacenanombre3') ?? _nombre3;
  }

  static set nombre3(String value) {
    _nombre3 = value;
    _prefs.setString('santacenanombre3', value);
  }

  static String get nombre4 {
    return _prefs.getString('santacenanombre4') ?? _nombre4;
  }

  static set nombre4(String value) {
    _nombre4 = value;
    _prefs.setString('santacenanombre4', value);
  }

  static String get nombre5 {
    return _prefs.getString('santacenanombre5') ?? _nombre5;
  }

  static set nombre5(String value) {
    _nombre5 = value;
    _prefs.setString('santacenanombre5', value);
  }

  static String get observaciones {
    return _prefs.getString('santacenaobservaciones') ?? _observaciones;
  }

  static set observaciones(String value) {
    _observaciones = value;
    _prefs.setString('santacenaobservaciones', value);
  }

  static String get nombre1 {
    return _prefs.getString('santacenanombre1') ?? _nombre1;
  }

  static set nombre1(String value) {
    _nombre1 = value;
    _prefs.setString('santacenanombre1', value);
  }

  static String get ausentename {
    return _prefs.getString('santacenaausentename') ?? _ausentename;
  }

  static set ausentename(String value) {
    _ausentename = value;
    _prefs.setString('santacenaausentename', value);
  }

  static String get tardename {
    return _prefs.getString('santacenatardename') ?? _tardename;
  }

  static set tardename(String value) {
    _tardename = value;
    _prefs.setString('santacenatardename', value);
  }

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get field0 {
    return _prefs.getBool("santacenacampo0") ?? _field0;
  }

  static set field0(bool value) {
    _field0 = value;
    _prefs.setBool("santacenacampo0", value);
  }

  static bool get field1 {
    return _prefs.getBool("santacenacampo1") ?? _field1;
  }

  static set field1(bool value) {
    _field1 = value;
    _prefs.setBool("santacenacampo1", value);
  }

  static bool get field2 {
    return _prefs.getBool("santacenacampo2") ?? _field2;
  }

  static set field2(bool value) {
    _field2 = value;
    _prefs.setBool("santacenacampo2", value);
  }

  static bool get field3 {
    return _prefs.getBool("santacenacampo3") ?? _field3;
  }

  static set field3(bool value) {
    _field3 = value;
    _prefs.setBool("santacenacampo3", value);
  }

  static bool get field4 {
    return _prefs.getBool("santacenacampo4") ?? _field4;
  }

  static set field4(bool value) {
    _field4 = value;
    _prefs.setBool("santacenacampo4", value);
  }

  static bool get field5 {
    return _prefs.getBool("santacenacampo5") ?? _field5;
  }

  static set field5(bool value) {
    _field5 = value;
    _prefs.setBool("santacenacampo5", value);
  }

  static bool get field6 {
    return _prefs.getBool("santacenacampo6") ?? _field6;
  }

  static set field6(bool value) {
    _field6 = value;
    _prefs.setBool("santacenacampo6", value);
  }

  static bool get field7 {
    return _prefs.getBool("santacenacampo7") ?? _field7;
  }

  static set field7(bool value) {
    _field7 = value;
    _prefs.setBool("santacenacampo7", value);
  }

  static bool get field8 {
    return _prefs.getBool("santacenacampo8") ?? _field8;
  }

  static set field8(bool value) {
    _field8 = value;
    _prefs.setBool("santacenacampo8", value);
  }

  static bool get field9 {
    return _prefs.getBool("santacenacampo9") ?? _field9;
  }

  static set field9(bool value) {
    _field9 = value;
    _prefs.setBool("santacenacampo9", value);
  }

  static bool get field10 {
    return _prefs.getBool("santacenacampo10") ?? _field10;
  }

  static set field10(bool value) {
    _field10 = value;
    _prefs.setBool("santacenacampo10", value);
  }

  static bool get field11 {
    return _prefs.getBool("santacenacampo11") ?? _field11;
  }

  static set field11(bool value) {
    _field11 = value;
    _prefs.setBool("santacenacampo11", value);
  }

  static bool get field12 {
    return _prefs.getBool("santacenacampo12") ?? _field12;
  }

  static set field12(bool value) {
    _field12 = value;
    _prefs.setBool("santacenacampo12", value);
  }

  static bool get field13 {
    return _prefs.getBool("santacenacampo13") ?? _field13;
  }

  static set field13(bool value) {
    _field13 = value;
    _prefs.setBool("santacenacampo13", value);
  }

  static bool get field14 {
    return _prefs.getBool("santacenacampo14") ?? _field14;
  }

  static set field14(bool value) {
    _field14 = value;
    _prefs.setBool("santacenacampo14", value);
  }

  static bool get field15 {
    return _prefs.getBool("santacenacampo15") ?? _field15;
  }

  static set field15(bool value) {
    _field15 = value;
    _prefs.setBool("santacenacampo15", value);
  }

  static bool get field16 {
    return _prefs.getBool("santacenacampo16") ?? _field16;
  }

  static set field16(bool value) {
    _field16 = value;
    _prefs.setBool("santacenacampo16", value);
  }

  static bool get field17 {
    return _prefs.getBool("santacenacampo17") ?? _field17;
  }

  static set field17(bool value) {
    _field17 = value;
    _prefs.setBool("santacenacampo17", value);
  }
}
