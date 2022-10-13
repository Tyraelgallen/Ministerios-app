import 'package:shared_preferences/shared_preferences.dart';

class PreferencesTransmision {
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

  static String get observaciones {
    return _prefs.getString('transmisionobservaciones') ?? _observaciones;
  }

  static set observaciones(String value) {
    _observaciones = value;
    _prefs.setString('transmisionobservaciones', value);
  }

  static String get ausentename {
    return _prefs.getString('transmisionausentename') ?? _ausentename;
  }

  static set ausentename(String value) {
    _ausentename = value;
    _prefs.setString('transmisionausentename', value);
  }

  static String get tardename {
    return _prefs.getString('transmisiontardename') ?? _tardename;
  }

  static set tardename(String value) {
    _tardename = value;
    _prefs.setString('transmisiontardename', value);
  }

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get field0 {
    return _prefs.getBool("transmisioncampo0") ?? _field0;
  }

  static set field0(bool value) {
    _field0 = value;
    _prefs.setBool("transmisioncampo0", value);
  }

  static bool get field1 {
    return _prefs.getBool("transmisioncampo1") ?? _field1;
  }

  static set field1(bool value) {
    _field1 = value;
    _prefs.setBool("transmisioncampo1", value);
  }

  static bool get field2 {
    return _prefs.getBool("transmisioncampo2") ?? _field2;
  }

  static set field2(bool value) {
    _field2 = value;
    _prefs.setBool("transmisioncampo2", value);
  }

  static bool get field3 {
    return _prefs.getBool("transmisioncampo3") ?? _field3;
  }

  static set field3(bool value) {
    _field3 = value;
    _prefs.setBool("transmisioncampo3", value);
  }

  static bool get field4 {
    return _prefs.getBool("transmisioncampo4") ?? _field4;
  }

  static set field4(bool value) {
    _field4 = value;
    _prefs.setBool("transmisioncampo4", value);
  }

  static bool get field5 {
    return _prefs.getBool("transmisioncampo5") ?? _field5;
  }

  static set field5(bool value) {
    _field5 = value;
    _prefs.setBool("transmisioncampo5", value);
  }

  static bool get field6 {
    return _prefs.getBool("transmisioncampo6") ?? _field6;
  }

  static set field6(bool value) {
    _field6 = value;
    _prefs.setBool("transmisioncampo6", value);
  }

  static bool get field7 {
    return _prefs.getBool("transmisioncampo7") ?? _field7;
  }

  static set field7(bool value) {
    _field7 = value;
    _prefs.setBool("transmisioncampo7", value);
  }

  static bool get field8 {
    return _prefs.getBool("transmisioncampo8") ?? _field8;
  }

  static set field8(bool value) {
    _field8 = value;
    _prefs.setBool("transmisioncampo8", value);
  }

  static bool get field9 {
    return _prefs.getBool("transmisioncampo9") ?? _field9;
  }

  static set field9(bool value) {
    _field9 = value;
    _prefs.setBool("transmisioncampo9", value);
  }

  static bool get field10 {
    return _prefs.getBool("transmisioncampo10") ?? _field10;
  }

  static set field10(bool value) {
    _field10 = value;
    _prefs.setBool("transmisioncampo10", value);
  }

  static bool get field11 {
    return _prefs.getBool("transmisioncampo11") ?? _field11;
  }

  static set field11(bool value) {
    _field11 = value;
    _prefs.setBool("transmisioncampo11", value);
  }

  static bool get field12 {
    return _prefs.getBool("transmisioncampo12") ?? _field12;
  }

  static set field12(bool value) {
    _field12 = value;
    _prefs.setBool("transmisioncampo12", value);
  }

  static bool get field13 {
    return _prefs.getBool("transmisioncampo13") ?? _field13;
  }

  static set field13(bool value) {
    _field13 = value;
    _prefs.setBool("transmisioncampo13", value);
  }

  static bool get field14 {
    return _prefs.getBool("transmisioncampo14") ?? _field14;
  }

  static set field14(bool value) {
    _field14 = value;
    _prefs.setBool("transmisioncampo14", value);
  }

  static bool get field15 {
    return _prefs.getBool("transmisioncampo15") ?? _field15;
  }

  static set field15(bool value) {
    _field15 = value;
    _prefs.setBool("transmisioncampo15", value);
  }

  static bool get field16 {
    return _prefs.getBool("transmisioncampo16") ?? _field16;
  }

  static set field16(bool value) {
    _field16 = value;
    _prefs.setBool("transmisioncampo16", value);
  }

  static bool get field17 {
    return _prefs.getBool("transmisioncampo17") ?? _field17;
  }

  static set field17(bool value) {
    _field17 = value;
    _prefs.setBool("transmisioncampo17", value);
  }
}

class PreferencesProyeccion {
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

  static String get observaciones {
    return _prefs.getString('proyeccionobservaciones') ?? _observaciones;
  }

  static set observaciones(String value) {
    _observaciones = value;
    _prefs.setString('proyeccionobservaciones', value);
  }

  static String get ausentename {
    return _prefs.getString('proyeccionausentename') ?? _ausentename;
  }

  static set ausentename(String value) {
    _ausentename = value;
    _prefs.setString('proyeccionausentename', value);
  }

  static String get tardename {
    return _prefs.getString('proyecciontardename') ?? _tardename;
  }

  static set tardename(String value) {
    _tardename = value;
    _prefs.setString('proyecciontardename', value);
  }

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get field0 {
    return _prefs.getBool("proyeccioncampo0") ?? _field0;
  }

  static set field0(bool value) {
    _field0 = value;
    _prefs.setBool("proyeccioncampo0", value);
  }

  static bool get field1 {
    return _prefs.getBool("proyeccioncampo1") ?? _field1;
  }

  static set field1(bool value) {
    _field1 = value;
    _prefs.setBool("proyeccioncampo1", value);
  }

  static bool get field2 {
    return _prefs.getBool("proyeccioncampo2") ?? _field2;
  }

  static set field2(bool value) {
    _field2 = value;
    _prefs.setBool("proyeccioncampo2", value);
  }

  static bool get field3 {
    return _prefs.getBool("proyeccioncampo3") ?? _field3;
  }

  static set field3(bool value) {
    _field3 = value;
    _prefs.setBool("proyeccioncampo3", value);
  }

  static bool get field4 {
    return _prefs.getBool("proyeccioncampo4") ?? _field4;
  }

  static set field4(bool value) {
    _field4 = value;
    _prefs.setBool("proyeccioncampo4", value);
  }

  static bool get field5 {
    return _prefs.getBool("proyeccioncampo5") ?? _field5;
  }

  static set field5(bool value) {
    _field5 = value;
    _prefs.setBool("proyeccioncampo5", value);
  }

  static bool get field6 {
    return _prefs.getBool("proyeccioncampo6") ?? _field6;
  }

  static set field6(bool value) {
    _field6 = value;
    _prefs.setBool("proyeccioncampo6", value);
  }

  static bool get field7 {
    return _prefs.getBool("proyeccioncampo7") ?? _field7;
  }

  static set field7(bool value) {
    _field7 = value;
    _prefs.setBool("proyeccioncampo7", value);
  }

  static bool get field8 {
    return _prefs.getBool("proyeccioncampo8") ?? _field8;
  }

  static set field8(bool value) {
    _field8 = value;
    _prefs.setBool("proyeccioncampo8", value);
  }

  static bool get field9 {
    return _prefs.getBool("proyeccioncampo9") ?? _field9;
  }

  static set field9(bool value) {
    _field9 = value;
    _prefs.setBool("proyeccioncampo9", value);
  }

  static bool get field10 {
    return _prefs.getBool("proyeccioncampo10") ?? _field10;
  }

  static set field10(bool value) {
    _field10 = value;
    _prefs.setBool("proyeccioncampo10", value);
  }

  static bool get field11 {
    return _prefs.getBool("proyeccioncampo11") ?? _field11;
  }

  static set field11(bool value) {
    _field11 = value;
    _prefs.setBool("proyeccioncampo11", value);
  }

  static bool get field12 {
    return _prefs.getBool("proyeccioncampo12") ?? _field12;
  }

  static set field12(bool value) {
    _field12 = value;
    _prefs.setBool("proyeccioncampo12", value);
  }

  static bool get field13 {
    return _prefs.getBool("proyeccioncampo13") ?? _field13;
  }

  static set field13(bool value) {
    _field13 = value;
    _prefs.setBool("proyeccioncampo13", value);
  }

  static bool get field14 {
    return _prefs.getBool("proyeccioncampo14") ?? _field14;
  }

  static set field14(bool value) {
    _field14 = value;
    _prefs.setBool("proyeccioncampo14", value);
  }

  static bool get field15 {
    return _prefs.getBool("proyeccioncampo15") ?? _field15;
  }

  static set field15(bool value) {
    _field15 = value;
    _prefs.setBool("proyeccioncampo15", value);
  }

  static bool get field16 {
    return _prefs.getBool("proyeccioncampo16") ?? _field16;
  }

  static set field16(bool value) {
    _field16 = value;
    _prefs.setBool("proyeccioncampo16", value);
  }

  static bool get field17 {
    return _prefs.getBool("proyeccioncampo17") ?? _field17;
  }

  static set field17(bool value) {
    _field17 = value;
    _prefs.setBool("proyeccioncampo17", value);
  }
}

class PreferencesCamara {
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

  static String get observaciones {
    return _prefs.getString('camaraobservaciones') ?? _observaciones;
  }

  static set observaciones(String value) {
    _observaciones = value;
    _prefs.setString('camaraobservaciones', value);
  }

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get field0 {
    return _prefs.getBool("camaracampo0") ?? _field0;
  }

  static set field0(bool value) {
    _field0 = value;
    _prefs.setBool("camaracampo0", value);
  }

  static bool get field1 {
    return _prefs.getBool("camaracampo1") ?? _field1;
  }

  static set field1(bool value) {
    _field1 = value;
    _prefs.setBool("camaracampo1", value);
  }

  static bool get field2 {
    return _prefs.getBool("camaracampo2") ?? _field2;
  }

  static set field2(bool value) {
    _field2 = value;
    _prefs.setBool("camaracampo2", value);
  }

  static bool get field3 {
    return _prefs.getBool("camaracampo3") ?? _field3;
  }

  static set field3(bool value) {
    _field3 = value;
    _prefs.setBool("camaracampo3", value);
  }

  static bool get field4 {
    return _prefs.getBool("camaracampo4") ?? _field4;
  }

  static set field4(bool value) {
    _field4 = value;
    _prefs.setBool("camaracampo4", value);
  }

  static bool get field5 {
    return _prefs.getBool("camaracampo5") ?? _field5;
  }

  static set field5(bool value) {
    _field5 = value;
    _prefs.setBool("camaracampo5", value);
  }

  static bool get field6 {
    return _prefs.getBool("camaracampo6") ?? _field6;
  }

  static set field6(bool value) {
    _field6 = value;
    _prefs.setBool("camaracampo6", value);
  }

  static bool get field7 {
    return _prefs.getBool("camaracampo7") ?? _field7;
  }

  static set field7(bool value) {
    _field7 = value;
    _prefs.setBool("camaracampo7", value);
  }

  static bool get field8 {
    return _prefs.getBool("camaracampo8") ?? _field8;
  }

  static set field8(bool value) {
    _field8 = value;
    _prefs.setBool("camaracampo8", value);
  }

  static bool get field9 {
    return _prefs.getBool("camaracampo9") ?? _field9;
  }

  static set field9(bool value) {
    _field9 = value;
    _prefs.setBool("camaracampo9", value);
  }

  static bool get field10 {
    return _prefs.getBool("camaracampo10") ?? _field10;
  }

  static set field10(bool value) {
    _field10 = value;
    _prefs.setBool("camaracampo10", value);
  }

  static bool get field11 {
    return _prefs.getBool("camaracampo11") ?? _field11;
  }

  static set field11(bool value) {
    _field11 = value;
    _prefs.setBool("camaracampo11", value);
  }

  static bool get field12 {
    return _prefs.getBool("camaracampo12") ?? _field12;
  }

  static set field12(bool value) {
    _field12 = value;
    _prefs.setBool("camaracampo12", value);
  }

  static bool get field13 {
    return _prefs.getBool("camaracampo13") ?? _field13;
  }

  static set field13(bool value) {
    _field13 = value;
    _prefs.setBool("camaracampo13", value);
  }

  static bool get field14 {
    return _prefs.getBool("camaracampo14") ?? _field14;
  }

  static set field14(bool value) {
    _field14 = value;
    _prefs.setBool("camaracampo14", value);
  }
}

class PreferencesAnuncioAudiovisual {
  static late SharedPreferences _prefs;

  static String _nombre = "";
  static String _fecha = "";
  static String _horario = "";
  static String _info = "";
  static String _link = "";
  static String _path = "";

  static String get link {
    return _prefs.getString('linktutorialaudiovisual') ?? _link;
  }

  static set link(String value) {
    _link = value;
    _prefs.setString('linktutorialaudiovisual', value);
  }

  static String get path {
    return _prefs.getString('pathtutorialaudiovisual') ?? _path;
  }

  static set path(String value) {
    _path = value;
    _prefs.setString('pathtutorialaudiovisual', value);
  }

  static String get info {
    return _prefs.getString('infoanuncioaudiovisual') ?? _info;
  }

  static set info(String value) {
    _info = value;
    _prefs.setString('infoanuncioaudiovisual', value);
  }

  static String get nombre {
    return _prefs.getString('nombreanuncioaudiovisual') ?? _nombre;
  }

  static set nombre(String value) {
    _nombre = value;
    _prefs.setString('nombreanuncioaudiovisual', value);
  }

  static String get fecha {
    return _prefs.getString('fechaanuncioaudiovisual') ?? _fecha;
  }

  static set fecha(String value) {
    _fecha = value;
    _prefs.setString('fechaanuncioaudiovisual', value);
  }

  static String get horario {
    return _prefs.getString('horaanuncioaudiovisual') ?? _horario;
  }

  static set horario(String value) {
    _horario = value;
    _prefs.setString('horaanuncioaudiovisual', value);
  }

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }
}

class PreferencesTutorialAudiovisual {
  static late SharedPreferences _prefs;

  static String _nombre = "";
  static String _info = "";
  static String _link = "";

  static String get info {
    return _prefs.getString('infotutorialaudiovisual') ?? _info;
  }

  static set info(String value) {
    _info = value;
    _prefs.setString('infotutorialaudiovisual', value);
  }

  static String get nombre {
    return _prefs.getString('nombretutorialaudiovisual') ?? _nombre;
  }

  static set nombre(String value) {
    _nombre = value;
    _prefs.setString('nombretutorialaudiovisual', value);
  }

  static String get link {
    return _prefs.getString('linktutorialaudiovisual') ?? _link;
  }

  static set link(String value) {
    _link = value;
    _prefs.setString('linktutorialaudiovisual', value);
  }

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }
}
