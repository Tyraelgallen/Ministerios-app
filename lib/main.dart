// ignore_for_file: use_key_in_widget_constructors, unused_import, unnecessary_import
import 'package:desktop_window/desktop_window.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; //solo para android
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ministerios/screens/fotografia/cronograma_fotografia.dart';
import 'package:ministerios/screens/fotografia/cronograma_plataformas.dart';
import 'package:ministerios/screens/fotografia/fotografia_form.dart';
import 'package:ministerios/screens/screens.dart';
import 'package:ministerios/shared_pref/preferences_audiovisual.dart';
import 'package:firebase_core/firebase_core.dart'; //solo para android
import 'package:ministerios/screens/registros/registros.dart';
import 'package:ministerios/shared_pref/shared_pref.dart';
import 'package:ministerios/theme/theme_constants.dart';
import 'package:ministerios/theme/theme_manager.dart';
import 'package:firedart/firedart.dart'; //solo para windows

//void main() => runApp(MyApp());

const apiKey = "AIzaSyBIvfGEfiffPVruXi1-XnvHd7jdkAZ4zJ0"; //solo windows

const projectId = "appministerios"; //solo windows

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await PreferencesApp.init();
  await PreferencesContacto.init();
  PreferencesApp.isPcApp == true
      ? Firestore.initialize(projectId) //solo windows
      : await Firebase.initializeApp(); //solo android

  await PreferencesTransmision.init();
  await PreferencesProyeccion.init();
  await PreferencesCamara.init();
  await PreferencesAnuncioAudiovisual.init();
  await PreferencesTutorialAudiovisual.init();

  await PreferencesOrganizacion.init();
  await PreferencesCalle.init();
  await PreferencesSonido.init();
  await PreferencesMusicosAdoracion.init();
  await PreferencesVocesAdoracion.init();
  await PreferencesEstetica.init();
  await PreferencesSantaCena.init();
  await PreferencesFotografia.init();
  await PreferencesCronogramaFotografia.init();
  await PreferencesCronogramaPlataformas.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    themeManager.addListener(themeListener);
    if (PreferencesApp.isPcApp == true) {
      testWindowSize();
    }
    if (PreferencesApp.isDarkMode == true) {
      themeManager.toggleTheme(true);
    }
    super.initState();
  }

  testWindowSize() async {
    await DesktopWindow.setWindowSize(const Size(720, 720));
    await DesktopWindow.setMinWindowSize(const Size(480, 720));
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('es', 'ES'),
      title: 'Ministerios',
      debugShowCheckedModeBanner: false,
      initialRoute: PreferencesApp.firstLaunch == 0 ? 'login_screen' : 'home',
      routes: {
        "login_screen": (_) => const LoginScreen(),
        "home": (_) => const HomeScreen(),
        "settings": (_) => const SettingsScreen(),
        "nuevo_contacto": (_) => const NuevoContacto(),
        "registro_contacto": (_) => const ContactoScreen(),
        "tutorial_app": (_) => const TutorialApp(),
        "privacypolicy": (_) => const PoliticasScreen(),
        //---------------------------------------
        "registros_screen": (_) => const RegistrosScreen(),
        "registros_audiovisual": (_) => const RegistrosAudiovisual(),
        "registros_audiovisual_pc": (_) => const RegistrosAudiovisualPC(),
        "registros_sonido": (_) => const RegistroSonido(),
        "registros_voces": (_) => const RegistroVoces(),
        "registros_musicos": (_) => const RegistroMusicos(),
        "registros_organizacion": (_) => const RegistroOrganizacion(),
        "registros_calle": (_) => const RegistroCalle(),
        "registros_fotografia": (_) => const RegistroFotografia(),
        "registros_cena": (_) => const RegistroCena(),
        "registros_estetica": (_) => const RegistroEstetica(),
        //---------------------------------------
        "audiovisual_form": (_) => const AudiovisualForm(),
        "transmision_screen": (_) => const TransmisionScreen(),
        "proyeccion_screen": (_) => const ProyeccionScreen(),
        "camara_screen": (_) => const CamaraScreen(),
        "anuncios_vigentes": (_) => const AnunciosVigentes(),
        "crear_anuncio_audiovisual": (_) => const CrearAnuncio(),
        "tutoriales_audiovisual": (_) => const TutorialesAudiovisual(),
        "crear_tutorial_audiovisual": (_) => const CrearTutorial(),
        //---------------------------------------------
        "voces_screen": (_) => const VocesScreen(),
        "musicos_screen": (_) => const MusicosScreen(),
        "fotografia_screen": (_) => const FotografiaScreen(),
        "cena_screen": (_) => const SantaCenaScreen(),
        "estetica_screen": (_) => const EsteticaScreen(),
        "sonido_screen": (_) => const SonidoScreen(),
        "calle_screen": (_) => const CalleScreen(),
        "organizacion_screen": (_) => const OrganizacionScreen(),
        //-------------------------------------------
        "cronograma_fotografia": (_) => const CrearCronogramaFotografia(),
        "cronograma_plataformas": (_) => const CrearCronogramaPlataformas(),
        //-------------------------------------------
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.indigo,
        ),
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //   style: ElevatedButton.styleFrom(
        //     primary: Colors.blue, // background (button) color
        //     onPrimary: Colors.white, // foreground (text) color
        //   ),
        // ),
      ),
      darkTheme: darkTheme,
      themeMode: themeManager.themeMode,
    );
  }
}
