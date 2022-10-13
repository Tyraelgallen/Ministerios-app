import 'package:shared_preferences/shared_preferences.dart';

class PreferencesFotografia {
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

  static String _observaciones = "";

  static String get observaciones {
    return _prefs.getString('fotografiaobservaciones') ?? _observaciones;
  }

  static set observaciones(String value) {
    _observaciones = value;
    _prefs.setString('fotografiaobservaciones', value);
  }

  static String get nombre1 {
    return _prefs.getString('fotografianombre1') ?? _nombre1;
  }

  static set nombre1(String value) {
    _nombre1 = value;
    _prefs.setString('fotografianombre1', value);
  }

  static String get nombre2 {
    return _prefs.getString('fotografianombre2') ?? _nombre2;
  }

  static set nombre2(String value) {
    _nombre2 = value;
    _prefs.setString('fotografianombre2', value);
  }

  static String get nombre3 {
    return _prefs.getString('fotografianombre3') ?? _nombre3;
  }

  static set nombre3(String value) {
    _nombre3 = value;
    _prefs.setString('fotografianombre3', value);
  }

  static String get nombre4 {
    return _prefs.getString('fotografianombre4') ?? _nombre4;
  }

  static set nombre4(String value) {
    _nombre4 = value;
    _prefs.setString('fotografianombre4', value);
  }

  static String get nombre5 {
    return _prefs.getString('fotografianombre5') ?? _nombre5;
  }

  static set nombre5(String value) {
    _nombre5 = value;
    _prefs.setString('fotografianombre5', value);
  }

  static String get nombre6 {
    return _prefs.getString('fotografianombre6') ?? _nombre6;
  }

  static set nombre6(String value) {
    _nombre6 = value;
    _prefs.setString('fotografianombre6', value);
  }

  static String get nombre7 {
    return _prefs.getString('fotografianombre7') ?? _nombre7;
  }

  static set nombre7(String value) {
    _nombre7 = value;
    _prefs.setString('fotografianombre7', value);
  }

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get field0 {
    return _prefs.getBool("fotografiacampo0") ?? _field0;
  }

  static set field0(bool value) {
    _field0 = value;
    _prefs.setBool("fotografiacampo0", value);
  }

  static bool get field1 {
    return _prefs.getBool("fotografiacampo1") ?? _field1;
  }

  static set field1(bool value) {
    _field1 = value;
    _prefs.setBool("fotografiacampo1", value);
  }

  static bool get field2 {
    return _prefs.getBool("fotografiacampo2") ?? _field2;
  }

  static set field2(bool value) {
    _field2 = value;
    _prefs.setBool("fotografiacampo2", value);
  }

  static bool get field3 {
    return _prefs.getBool("fotografiacampo3") ?? _field3;
  }

  static set field3(bool value) {
    _field3 = value;
    _prefs.setBool("fotografiacampo3", value);
  }

  static bool get field4 {
    return _prefs.getBool("fotografiacampo4") ?? _field4;
  }

  static set field4(bool value) {
    _field4 = value;
    _prefs.setBool("fotografiacampo4", value);
  }

  static bool get field5 {
    return _prefs.getBool("fotografiacampo5") ?? _field5;
  }

  static set field5(bool value) {
    _field5 = value;
    _prefs.setBool("fotografiacampo5", value);
  }

  static bool get field6 {
    return _prefs.getBool("fotografiacampo6") ?? _field6;
  }

  static set field6(bool value) {
    _field6 = value;
    _prefs.setBool("fotografiacampo6", value);
  }

  static bool get field7 {
    return _prefs.getBool("fotografiacampo7") ?? _field7;
  }

  static set field7(bool value) {
    _field7 = value;
    _prefs.setBool("fotografiacampo7", value);
  }

  static bool get field8 {
    return _prefs.getBool("fotografiacampo8") ?? _field8;
  }

  static set field8(bool value) {
    _field8 = value;
    _prefs.setBool("fotografiacampo8", value);
  }

  static bool get field9 {
    return _prefs.getBool("fotografiacampo9") ?? _field9;
  }

  static set field9(bool value) {
    _field9 = value;
    _prefs.setBool("fotografiacampo9", value);
  }

  static bool get field10 {
    return _prefs.getBool("fotografiacampo10") ?? _field10;
  }

  static set field10(bool value) {
    _field10 = value;
    _prefs.setBool("fotografiacampo10", value);
  }

  static bool get field11 {
    return _prefs.getBool("fotografiacampo11") ?? _field11;
  }

  static set field11(bool value) {
    _field11 = value;
    _prefs.setBool("fotografiacampo11", value);
  }

  static bool get field12 {
    return _prefs.getBool("fotografiacampo12") ?? _field12;
  }

  static set field12(bool value) {
    _field12 = value;
    _prefs.setBool("fotografiacampo12", value);
  }

  static bool get field13 {
    return _prefs.getBool("fotografiacampo13") ?? _field13;
  }

  static set field13(bool value) {
    _field13 = value;
    _prefs.setBool("fotografiacampo13", value);
  }

  static bool get field14 {
    return _prefs.getBool("fotografiacampo14") ?? _field14;
  }

  static set field14(bool value) {
    _field14 = value;
    _prefs.setBool("fotografiacampo14", value);
  }

  static bool get field15 {
    return _prefs.getBool("fotografiacampo15") ?? _field15;
  }

  static set field15(bool value) {
    _field15 = value;
    _prefs.setBool("fotografiacampo15", value);
  }

  static bool get field16 {
    return _prefs.getBool("fotografiacampo16") ?? _field16;
  }

  static set field16(bool value) {
    _field16 = value;
    _prefs.setBool("fotografiacampo16", value);
  }

  static bool get field17 {
    return _prefs.getBool("fotografiacampo17") ?? _field17;
  }

  static set field17(bool value) {
    _field17 = value;
    _prefs.setBool("fotografiacampo17", value);
  }
}

class PreferencesCronogramaFotografia {
  static late SharedPreferences _prefs;

  static String _nombre = "";
  static String _fecha = "";
  static String _horario = "";
  static String _info = "";
  static String _link = "";
  static String _path = "";

  static String get link {
    return _prefs.getString('linkcronogramafotografia') ?? _link;
  }

  static set link(String value) {
    _link = value;
    _prefs.setString('linkcronogramafotografia', value);
  }

  static String get path {
    return _prefs.getString('pathcronogramafotografia') ?? _path;
  }

  static set path(String value) {
    _path = value;
    _prefs.setString('pathcronogramafotografia', value);
  }

  static String get info {
    return _prefs.getString('infocronogramafotografia') ?? _info;
  }

  static set info(String value) {
    _info = value;
    _prefs.setString('infocronogramafotografia', value);
  }

  static String get nombre {
    return _prefs.getString('nombrecronogramafotografia') ?? _nombre;
  }

  static set nombre(String value) {
    _nombre = value;
    _prefs.setString('nombrecronogramafotografia', value);
  }

  static String get fecha {
    return _prefs.getString('fechacronogramafotografia') ?? _fecha;
  }

  static set fecha(String value) {
    _fecha = value;
    _prefs.setString('fechacronogramafotografia', value);
  }

  static String get horario {
    return _prefs.getString('horacronogramafotografia') ?? _horario;
  }

  static set horario(String value) {
    _horario = value;
    _prefs.setString('horacronogramafotografia', value);
  }

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }
}

class PreferencesCronogramaPlataformas {
  static late SharedPreferences _prefs;

  static String _nombre = "";
  static String _info = "";
  static String _link = "";
  static String _path = "";
  static String _fecha = "";
  static String _publicacion = "";

  static String get publicacion {
    return _prefs.getString('publicacioncronogramaplataformas') ?? _publicacion;
  }

  static set publicacion(String value) {
    _publicacion = value;
    _prefs.setString('publicacioncronogramaplataformas', value);
  }

  static String get fecha {
    return _prefs.getString('fechacronogramaplataformas') ?? _fecha;
  }

  static set fecha(String value) {
    _fecha = value;
    _prefs.setString('fechacronogramaplataformas', value);
  }

  static String get path {
    return _prefs.getString('pathcronogramaplataformas') ?? _path;
  }

  static set path(String value) {
    _path = value;
    _prefs.setString('pathcronogramaplataformas', value);
  }

  static String get info {
    return _prefs.getString('infocronogramaplataformas') ?? _info;
  }

  static set info(String value) {
    _info = value;
    _prefs.setString('infocronogramaplataformas', value);
  }

  static String get nombre {
    return _prefs.getString('nombrecronogramaplataformas') ?? _nombre;
  }

  static set nombre(String value) {
    _nombre = value;
    _prefs.setString('nombrecronogramaplataformas', value);
  }

  static String get link {
    return _prefs.getString('linkcronogramaplataformas') ?? _link;
  }

  static set link(String value) {
    _link = value;
    _prefs.setString('linkcronogramaplataformas', value);
  }

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }
}
