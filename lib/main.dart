// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'Controller/language_controller.dart';
import 'home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  final String languageCode  = preferences.getString("language_code") ?? "en";
  runApp( MyApp(local: languageCode));
}

class MyApp extends StatelessWidget {
   MyApp({super.key, required this.local });
String local;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => LanguageController(),),
    ],
    child: Consumer<LanguageController>(
      builder: (context, provider, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          locale: provider.getLanguage,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale("en"),
            Locale("ur"),
            Locale("hi"),
          ],
          theme: ThemeData(
           primarySwatch: Colors.lime
          ),
          home: const HomePage(),
        );
      },
    ),
    );
  }
}


