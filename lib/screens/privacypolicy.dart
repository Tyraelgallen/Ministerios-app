// ignore_for_file: sized_box_for_whitespace, depend_on_referenced_packages, implementation_imports
import 'package:ministerios/screens/screen_dependencies.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';
import 'package:url_launcher/src/url_launcher_uri.dart';

class PoliticasScreen extends StatelessWidget {
  const PoliticasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Política de Privacidad           ")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Habiendo accedido a esta aplicación, usted aceptó las presentes politicas de privacidad.",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 15),
          const FadeInImage(
            placeholder: AssetImage("assets/policy.jpeg"),
            image: AssetImage("assets/policy.jpeg"),
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 15),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: ElevatedButton(
                  onPressed: () async {
                    const urligle = "https://pxlv.emilioborovski.com/";
                    final uriigle =
                        Uri.parse("https://pxlv.emilioborovski.com/");
                    if (PreferencesApp.isPcApp == true) {
                      if (await UrlLauncherPlatform.instance
                          .canLaunch(urligle)) {
                        await UrlLauncherPlatform.instance.launch(
                          urligle,
                          useSafariVC: false,
                          useWebView: false,
                          enableJavaScript: false,
                          enableDomStorage: false,
                          universalLinksOnly: false,
                          headers: <String, String>{},
                        );
                      }
                    } else {
                      if (await canLaunchUrl(uriigle)) {
                        await launchUrl(uriigle);
                      }
                    }
                  },
                  child: const Text("Ir a las Políticas de Privacidad")),
            ),
          ),
        ],
      ),
    );
  }
}
