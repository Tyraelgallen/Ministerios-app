import 'package:shared_preferences/shared_preferences.dart';

class PreferencesOrganizacion {
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

  static String _nombre1 = "";
  static String _nombre2 = "";
  static String _nombre3 = "";
  static String _nombre4 = "";
  static String _nombre5 = "";
  static String _nombre6 = "";
  static String _nombre7 = "";
  static String _nombre8 = "";
  static String _nombre9 = "";
  static String _nombre10 = "";
  static String _nombre11 = "";
  static String _nombre12 = "";
  static String _nombre13 = "";
  static String _nombre14 = "";
  static String _nombre15 = "";
  static String _nombre16 = "";
  static String _nombre17 = "";
  static String _nombre18 = "";
  static String _nombre19 = "";

  static String _ausentename = "";

  static String _tardename = "";

  static String _observaciones = "";

  static String get nombre1 {
    return _prefs.getString('orgnombre1') ?? _nombre1;
  }

  static set nombre1(String value) {
    _nombre1 = value;
    _prefs.setString('orgnombre1', value);
  }

  static String get nombre2 {
    return _prefs.getString('orgnombre2') ?? _nombre2;
  }

  static set nombre2(String value) {
    _nombre2 = value;
    _prefs.setString('orgnombre2', value);
  }

  static String get nombre3 {
    return _prefs.getString('orgnombre3') ?? _nombre3;
  }

  static set nombre3(String value) {
    _nombre3 = value;
    _prefs.setString('orgnombre3', value);
  }

  static String get nombre4 {
    return _prefs.getString('orgnombre4') ?? _nombre4;
  }

  static set nombre4(String value) {
    _nombre4 = value;
    _prefs.setString('orgnombre4', value);
  }

  static String get nombre5 {
    return _prefs.getString('orgnombre5') ?? _nombre5;
  }

  static set nombre5(String value) {
    _nombre5 = value;
    _prefs.setString('orgnombre5', value);
  }

  static String get nombre6 {
    return _prefs.getString('orgnombre6') ?? _nombre6;
  }

  static set nombre6(String value) {
    _nombre6 = value;
    _prefs.setString('orgnombre6', value);
  }

  static String get nombre7 {
    return _prefs.getString('orgnombre7') ?? _nombre7;
  }

  static set nombre7(String value) {
    _nombre7 = value;
    _prefs.setString('orgnombre7', value);
  }

  static String get nombre8 {
    return _prefs.getString('orgnombre8') ?? _nombre8;
  }

  static set nombre8(String value) {
    _nombre8 = value;
    _prefs.setString('orgnombre8', value);
  }

  static String get nombre9 {
    return _prefs.getString('orgnombre9') ?? _nombre9;
  }

  static set nombre9(String value) {
    _nombre9 = value;
    _prefs.setString('orgnombre9', value);
  }

  static String get nombre10 {
    return _prefs.getString('orgnombre10') ?? _nombre10;
  }

  static set nombre10(String value) {
    _nombre10 = value;
    _prefs.setString('orgnombre10', value);
  }

  static String get nombre11 {
    return _prefs.getString('orgnombre11') ?? _nombre11;
  }

  static set nombre11(String value) {
    _nombre11 = value;
    _prefs.setString('orgnombre11', value);
  }

  static String get nombre12 {
    return _prefs.getString('orgnombre12') ?? _nombre12;
  }

  static set nombre12(String value) {
    _nombre12 = value;
    _prefs.setString('orgnombre12', value);
  }

  static String get nombre13 {
    return _prefs.getString('orgnombre13') ?? _nombre13;
  }

  static set nombre13(String value) {
    _nombre13 = value;
    _prefs.setString('orgnombre13', value);
  }

  static String get nombre14 {
    return _prefs.getString('orgnombre14') ?? _nombre14;
  }

  static set nombre14(String value) {
    _nombre14 = value;
    _prefs.setString('orgnombre14', value);
  }

  static String get nombre15 {
    return _prefs.getString('orgnombre15') ?? _nombre15;
  }

  static set nombre15(String value) {
    _nombre15 = value;
    _prefs.setString('orgnombre15', value);
  }

  static String get nombre16 {
    return _prefs.getString('orgnombre16') ?? _nombre16;
  }

  static set nombre16(String value) {
    _nombre16 = value;
    _prefs.setString('orgnombre16', value);
  }

  static String get nombre17 {
    return _prefs.getString('orgnombre17') ?? _nombre17;
  }

  static set nombre17(String value) {
    _nombre17 = value;
    _prefs.setString('orgnombre17', value);
  }

  static String get nombre18 {
    return _prefs.getString('orgnombre18') ?? _nombre18;
  }

  static set nombre18(String value) {
    _nombre18 = value;
    _prefs.setString('orgnombre18', value);
  }

  static String get nombre19 {
    return _prefs.getString('orgnombre19') ?? _nombre19;
  }

  static set nombre19(String value) {
    _nombre19 = value;
    _prefs.setString('orgnombre19', value);
  }

  static String get observaciones {
    return _prefs.getString('organizacionobservaciones') ?? _observaciones;
  }

  static set observaciones(String value) {
    _observaciones = value;
    _prefs.setString('organizacionobservaciones', value);
  }

  static String get ausentename {
    return _prefs.getString('organizacionausentename') ?? _ausentename;
  }

  static set ausentename(String value) {
    _ausentename = value;
    _prefs.setString('organizacionausentename', value);
  }

  static String get tardename {
    return _prefs.getString('organizaciontardename') ?? _tardename;
  }

  static set tardename(String value) {
    _tardename = value;
    _prefs.setString('organizaciontardename', value);
  }

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get field0 {
    return _prefs.getBool("organizacioncampo0") ?? _field0;
  }

  static set field0(bool value) {
    _field0 = value;
    _prefs.setBool("organizacioncampo0", value);
  }

  static bool get field1 {
    return _prefs.getBool("organizacioncampo1") ?? _field1;
  }

  static set field1(bool value) {
    _field1 = value;
    _prefs.setBool("organizacioncampo1", value);
  }

  static bool get field2 {
    return _prefs.getBool("organizacioncampo2") ?? _field2;
  }

  static set field2(bool value) {
    _field2 = value;
    _prefs.setBool("organizacioncampo2", value);
  }

  static bool get field3 {
    return _prefs.getBool("organizacioncampo3") ?? _field3;
  }

  static set field3(bool value) {
    _field3 = value;
    _prefs.setBool("organizacioncampo3", value);
  }

  static bool get field4 {
    return _prefs.getBool("organizacioncampo4") ?? _field4;
  }

  static set field4(bool value) {
    _field4 = value;
    _prefs.setBool("organizacioncampo4", value);
  }

  static bool get field5 {
    return _prefs.getBool("organizacioncampo5") ?? _field5;
  }

  static set field5(bool value) {
    _field5 = value;
    _prefs.setBool("organizacioncampo5", value);
  }

  static bool get field6 {
    return _prefs.getBool("organizacioncampo6") ?? _field6;
  }

  static set field6(bool value) {
    _field6 = value;
    _prefs.setBool("organizacioncampo6", value);
  }

  static bool get field7 {
    return _prefs.getBool("organizacioncampo7") ?? _field7;
  }

  static set field7(bool value) {
    _field7 = value;
    _prefs.setBool("organizacioncampo7", value);
  }

  static bool get field8 {
    return _prefs.getBool("organizacioncampo8") ?? _field8;
  }

  static set field8(bool value) {
    _field8 = value;
    _prefs.setBool("organizacioncampo8", value);
  }

  static bool get field9 {
    return _prefs.getBool("organizacioncampo9") ?? _field9;
  }

  static set field9(bool value) {
    _field9 = value;
    _prefs.setBool("organizacioncampo9", value);
  }

  static bool get field10 {
    return _prefs.getBool("organizacioncampo10") ?? _field10;
  }

  static set field10(bool value) {
    _field10 = value;
    _prefs.setBool("organizacioncampo10", value);
  }

  static bool get field11 {
    return _prefs.getBool("organizacioncampo11") ?? _field11;
  }

  static set field11(bool value) {
    _field11 = value;
    _prefs.setBool("organizacioncampo11", value);
  }

  static bool get field12 {
    return _prefs.getBool("organizacioncampo12") ?? _field12;
  }

  static set field12(bool value) {
    _field12 = value;
    _prefs.setBool("organizacioncampo12", value);
  }

  static bool get field13 {
    return _prefs.getBool("organizacioncampo13") ?? _field13;
  }

  static set field13(bool value) {
    _field13 = value;
    _prefs.setBool("organizacioncampo13", value);
  }

  static bool get field14 {
    return _prefs.getBool("organizacioncampo14") ?? _field14;
  }

  static set field14(bool value) {
    _field14 = value;
    _prefs.setBool("organizacioncampo14", value);
  }

  static bool get field15 {
    return _prefs.getBool("organizacioncampo15") ?? _field15;
  }

  static set field15(bool value) {
    _field15 = value;
    _prefs.setBool("organizacioncampo15", value);
  }

  static bool get field16 {
    return _prefs.getBool("organizacioncampo16") ?? _field16;
  }

  static set field16(bool value) {
    _field16 = value;
    _prefs.setBool("organizacioncampo16", value);
  }

  static bool get field17 {
    return _prefs.getBool("organizacioncampo17") ?? _field17;
  }

  static set field17(bool value) {
    _field17 = value;
    _prefs.setBool("organizacioncampo17", value);
  }
}

class PreferencesCalle {
  static late SharedPreferences _prefs;

  static String _nombre1 = "";
  static String _nombre2 = "";
  static String _nombre3 = "";
  static String _nombre4 = "";
  static String _nombre5 = "";
  static String _nombre6 = "";
  static String _nombre7 = "";
  static String _nombre8 = "";
  static String _nombre9 = "";
  static String _nombre10 = "";
  static String _nombre11 = "";
  static String _nombre12 = "";
  static String _nombre13 = "";
  static String _nombre14 = "";
  static String _nombre15 = "";
  static String _nombre16 = "";
  static String _nombre17 = "";
  static String _nombre18 = "";
  static String _nombre19 = "";

  static String _observaciones = "";

  static String get observaciones {
    return _prefs.getString('calleobservaciones') ?? _observaciones;
  }

  static set observaciones(String value) {
    _observaciones = value;
    _prefs.setString('calleobservaciones', value);
  }

  static String get nombre1 {
    return _prefs.getString('callenombre1') ?? _nombre1;
  }

  static set nombre1(String value) {
    _nombre1 = value;
    _prefs.setString('callenombre1', value);
  }

  static String get nombre2 {
    return _prefs.getString('callenombre2') ?? _nombre2;
  }

  static set nombre2(String value) {
    _nombre2 = value;
    _prefs.setString('callenombre2', value);
  }

  static String get nombre3 {
    return _prefs.getString('callenombre3') ?? _nombre3;
  }

  static set nombre3(String value) {
    _nombre3 = value;
    _prefs.setString('callenombre3', value);
  }

  static String get nombre4 {
    return _prefs.getString('callenombre4') ?? _nombre4;
  }

  static set nombre4(String value) {
    _nombre4 = value;
    _prefs.setString('callenombre4', value);
  }

  static String get nombre5 {
    return _prefs.getString('callenombre5') ?? _nombre5;
  }

  static set nombre5(String value) {
    _nombre5 = value;
    _prefs.setString('callenombre5', value);
  }

  static String get nombre6 {
    return _prefs.getString('callenombre6') ?? _nombre6;
  }

  static set nombre6(String value) {
    _nombre6 = value;
    _prefs.setString('callenombre6', value);
  }

  static String get nombre7 {
    return _prefs.getString('callenombre7') ?? _nombre7;
  }

  static set nombre7(String value) {
    _nombre7 = value;
    _prefs.setString('callenombre7', value);
  }

  static String get nombre8 {
    return _prefs.getString('callenombre8') ?? _nombre8;
  }

  static set nombre8(String value) {
    _nombre8 = value;
    _prefs.setString('callenombre8', value);
  }

  static String get nombre9 {
    return _prefs.getString('callenombre9') ?? _nombre9;
  }

  static set nombre9(String value) {
    _nombre9 = value;
    _prefs.setString('callenombre9', value);
  }

  static String get nombre10 {
    return _prefs.getString('callenombre10') ?? _nombre10;
  }

  static set nombre10(String value) {
    _nombre10 = value;
    _prefs.setString('callenombre10', value);
  }

  static String get nombre11 {
    return _prefs.getString('callenombre11') ?? _nombre11;
  }

  static set nombre11(String value) {
    _nombre11 = value;
    _prefs.setString('callenombre11', value);
  }

  static String get nombre12 {
    return _prefs.getString('callenombre12') ?? _nombre12;
  }

  static set nombre12(String value) {
    _nombre12 = value;
    _prefs.setString('callenombre12', value);
  }

  static String get nombre13 {
    return _prefs.getString('callenombre13') ?? _nombre13;
  }

  static set nombre13(String value) {
    _nombre13 = value;
    _prefs.setString('callenombre13', value);
  }

  static String get nombre14 {
    return _prefs.getString('callenombre14') ?? _nombre14;
  }

  static set nombre14(String value) {
    _nombre14 = value;
    _prefs.setString('callenombre14', value);
  }

  static String get nombre15 {
    return _prefs.getString('callenombre15') ?? _nombre15;
  }

  static set nombre15(String value) {
    _nombre15 = value;
    _prefs.setString('callenombre15', value);
  }

  static String get nombre16 {
    return _prefs.getString('callenombre16') ?? _nombre16;
  }

  static set nombre16(String value) {
    _nombre16 = value;
    _prefs.setString('callenombre16', value);
  }

  static String get nombre17 {
    return _prefs.getString('callenombre17') ?? _nombre17;
  }

  static set nombre17(String value) {
    _nombre17 = value;
    _prefs.setString('callenombre17', value);
  }

  static String get nombre18 {
    return _prefs.getString('callenombre18') ?? _nombre18;
  }

  static set nombre18(String value) {
    _nombre18 = value;
    _prefs.setString('callenombre18', value);
  }

  static String get nombre19 {
    return _prefs.getString('callenombre19') ?? _nombre19;
  }

  static set nombre19(String value) {
    _nombre19 = value;
    _prefs.setString('callenombre19', value);
  }

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }
}
