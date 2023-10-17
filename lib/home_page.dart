import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'Controller/language_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Localization"),
      centerTitle: true,
      actions: [
        Consumer<LanguageController>(builder: (context, provider, child) {
          return PopupMenuButton<Language>(
              onSelected: (Language item) {
                if(Language.english.name == item.name){
                  provider.changeLanguage(const Locale("en"));
                }else if(Language.urdu.name == item.name){
                  provider.changeLanguage(const Locale("ur"));
                }else{
                  provider.changeLanguage(const Locale("hi"));
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Language>>[
                const PopupMenuItem(
                  value: Language.english,
                  child: Text("English"),
                ),
                const PopupMenuItem(
                  value: Language.urdu,
                  child: Text("Urdu"
                      ""),
                ),
                const PopupMenuItem(
                  value: Language.hindi,
                  child: Text("Hindi"),
                ),
              ]);
        },)
      ],
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: NetworkImage("https://www.agilify.co.uk/wp-content/uploads/2021/03/photos-with-story-featured-15.jpeg")),
              Center(child: Text(AppLocalizations.of(context)!.story,style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w800),),)
            ],
          ),
        ),
      ),
    );
  }
}

enum Language { english, urdu, hindi }