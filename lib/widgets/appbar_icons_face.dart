// ignore_for_file: depend_on_referenced_packages, implementation_imports, unused_import

import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';
import 'package:url_launcher/src/url_launcher_uri.dart';
import 'package:flutter/material.dart';
import 'package:ministerios/shared_pref/preferencesapp.dart';

class AppBarActions extends StatelessWidget {
  const AppBarActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferencesApp.firstLaunch != 3
        ? Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    const urligle =
                        "https://www.youtube.com/user/igleproducciones";
                    final uriigle = Uri.parse(
                        "https://www.youtube.com/user/igleproducciones");
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
                  child: const CircleAvatar(
                    backgroundImage: AssetImage("assets/youtube.jpg"),
                    radius: 20,
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () async {
                    const urligle =
                        "https://www.facebook.com/iglesiapasionxlavida";
                    final uriigle = Uri.parse(
                        "https://www.facebook.com/iglesiapasionxlavida");
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
                  child: const CircleAvatar(
                    backgroundImage: AssetImage("assets/facebook.jpg"),
                    radius: 20,
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () async {
                    const urlmachin = "https://www.facebook.com/machin.lie.7";
                    final urimachin =
                        Uri.parse("https://www.facebook.com/machin.lie.7");
                    if (PreferencesApp.isPcApp == true) {
                      if (await UrlLauncherPlatform.instance
                          .canLaunch(urlmachin)) {
                        await UrlLauncherPlatform.instance.launch(
                          urlmachin,
                          useSafariVC: false,
                          useWebView: false,
                          enableJavaScript: false,
                          enableDomStorage: false,
                          universalLinksOnly: false,
                          headers: <String, String>{},
                        );
                      }
                    } else {
                      if (await canLaunchUrl(urimachin)) {
                        await launchUrl(urimachin);
                      }
                    }
                  },
                  child: const CircleAvatar(
                    backgroundImage: AssetImage("assets/machin.jpg"),
                    radius: 20,
                  ),
                ),
              ],
            ),
          )
        : const SizedBox(
            height: 0,
            width: 0,
          );
  }
}
