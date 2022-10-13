import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io' show Platform;

final _fechaactual = DateTime.now();
dynamic _dia = switchWithString();
final _day = DateFormat('EEEE').format(_fechaactual);

switchWithString() {
  switch (_day) {
    case 'Sunday':
      return _dia = 'Domingo';

    case 'Monday':
      return _dia = 'Lunes';

    case 'Tuesday':
      return _dia = 'Martes';

    case 'Wednesday':
      return _dia = 'Miercoles';

    case 'Thursday':
      return _dia = 'Jueves';

    case 'Friday':
      return _dia = 'Viernes';

    case 'Saturday':
      return _dia = 'Sabado';

    default:
      return _dia = '';
  }
}

class PreferencesApp {
  static late SharedPreferences _prefs;

  static String _name = "";
  static String _diaactual = _dia;
  static int _firstLaunch = 0;
  static bool _isDarkMode = false;
  static bool _isPcApp = Platform.isWindows ? true : false;

  static bool _visibleAudiovisual = true;
  static bool _visibleSonido = true;
  static bool _visibleVoces = true;
  static bool _visibleMusicos = true;
  static bool _visibleOrganizacion = true;
  static bool _visibleCalle = true;
  static bool _visibleFotografia = true;
  static bool _visibleCena = true;
  static bool _visibleEstetica = true;

  static bool _contactos = false;

  static bool get contactos {
    return _prefs.getBool('contactos') ?? _contactos;
  }

  static set contactos(bool value) {
    _contactos = value;
    _prefs.setBool('contactos', value);
  }

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get dia {
    return _prefs.getString('diaactual') ?? _diaactual;
  }

  static set dia(String value) {
    _diaactual = value;
    _prefs.setString('diaactual', value);
  }

  static int get firstLaunch {
    return _prefs.getInt("login") ?? _firstLaunch;
  }

  static set firstLaunch(int value) {
    _firstLaunch = value;
    _prefs.setInt("login", value);
  }

  static String get name {
    return _prefs.getString('name') ?? _name;
  }

  static set name(String value) {
    _name = value;
    _prefs.setString('name', value);
  }

  static bool get isDarkMode {
    return _prefs.getBool('isDarkMode') ?? _isDarkMode;
  }

  static set isDarkMode(bool value) {
    _isDarkMode = value;
    _prefs.setBool('isDarkMode', value);
  }

  static bool get isPcApp {
    return _prefs.getBool('isPcApp') ?? _isPcApp;
  }

  static set isPcApp(bool value) {
    _isPcApp = value;
    _prefs.setBool('isPcApp', value);
  }

  //--------------------------------------------------------

  static bool get visibleaudiovisual {
    return _prefs.getBool('minis1') ?? _visibleAudiovisual;
  }

  static set visibleaudiovisual(bool value) {
    _visibleAudiovisual = value;
    _prefs.setBool('minis1', value);
  }

  static bool get visiblesonido {
    return _prefs.getBool('minis2') ?? _visibleSonido;
  }

  static set visiblesonido(bool value) {
    _visibleSonido = value;
    _prefs.setBool('minis2', value);
  }

  static bool get visiblevoces {
    return _prefs.getBool('minis3') ?? _visibleVoces;
  }

  static set visiblevoces(bool value) {
    _visibleVoces = value;
    _prefs.setBool('minis3', value);
  }

  static bool get visiblemusicos {
    return _prefs.getBool('minis4') ?? _visibleMusicos;
  }

  static set visiblemusicos(bool value) {
    _visibleMusicos = value;
    _prefs.setBool('minis4', value);
  }

  static bool get visibleorg {
    return _prefs.getBool('minis5') ?? _visibleOrganizacion;
  }

  static set visibleorg(bool value) {
    _visibleOrganizacion = value;
    _prefs.setBool('minis5', value);
  }

  static bool get visiblecalle {
    return _prefs.getBool('minis6') ?? _visibleCalle;
  }

  static set visiblecalle(bool value) {
    _visibleCalle = value;
    _prefs.setBool('minis6', value);
  }

  static bool get visiblefotografia {
    return _prefs.getBool('minis7') ?? _visibleFotografia;
  }

  static set visiblefotografia(bool value) {
    _visibleFotografia = value;
    _prefs.setBool('minis7', value);
  }

  static bool get visiblecena {
    return _prefs.getBool('minis8') ?? _visibleCena;
  }

  static set visiblecena(bool value) {
    _visibleCena = value;
    _prefs.setBool('minis8', value);
  }

  static bool get visibleestetica {
    return _prefs.getBool('minis9') ?? _visibleEstetica;
  }

  static set visibleestetica(bool value) {
    _visibleEstetica = value;
    _prefs.setBool('minis9', value);
  }
}

class PreferencesContacto {
  static late SharedPreferences _prefs;

  static String _nombre = "";
  static String _numero = "";
  static String _horario = "";
  static String _info = "";

  static String get info {
    return _prefs.getString('infocontacto') ?? _info;
  }

  static set info(String value) {
    _info = value;
    _prefs.setString('infocontacto', value);
  }

  static String get nombre {
    return _prefs.getString('nombrecontacto') ?? _nombre;
  }

  static set nombre(String value) {
    _nombre = value;
    _prefs.setString('nombrecontacto', value);
  }

  static String get numero {
    return _prefs.getString('numerocontacto') ?? _numero;
  }

  static set numero(String value) {
    _numero = value;
    _prefs.setString('numerocontacto', value);
  }

  static String get horario {
    return _prefs.getString('horacontacto') ?? _horario;
  }

  static set horario(String value) {
    _horario = value;
    _prefs.setString('horacontacto', value);
  }

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }
}
