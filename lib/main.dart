import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:profile/progress_column.dart';

typedef SetLocale = void Function(Locale locale);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static const String home = 'https://github.com/Seongbeom-Park';
  static const String mail = 'sparkamita90@gmail.com';

  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Locale? _locale;

  set locale(Locale locale) => setState(() => _locale = locale);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '개발자 박성범',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ko'),
      ],
      locale: _locale,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MainPage(setLocale: (Locale _) => locale = _),
    );
  }
}

class MainPage extends StatelessWidget {
  final SetLocale setLocale;

  const MainPage({super.key, required this.setLocale});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.title),
          actions: [
            IconButton(
                onPressed: () => launchUrl(Uri.parse(MyApp.home)),
                icon: Image.asset(
                    'resource/icons/github/GitHub-Mark-Light-64px.png')),
            IconButton(
                onPressed: () => launchUrl(Uri.parse('mailto:${MyApp.mail}')),
                icon: const Icon(Icons.email_outlined)),
            const Icon(Icons.language),
            LanguageDropdown(setLocale: setLocale),
          ],
        ),
        body: const BodyWidget());
  }
}

class LanguageDropdown extends StatelessWidget {
  final SetLocale setLocale;

  const LanguageDropdown({super.key, required this.setLocale});

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      icon: const Icon(Icons.arrow_drop_down),
      value: Localizations.localeOf(context).toLanguageTag(),
      items: const [
        DropdownMenuItem(value: 'ko', child: Text('한국어')),
        DropdownMenuItem(value: 'en', child: Text('English')),
      ],
      onChanged: (value) => setLocale(Locale(value!)),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Introduction(),
      Expanded(
          child: Row(
        children: [
          ProgressColumn.progress(),
          ProgressColumn.done(),
        ],
      )),
    ]);
  }
}

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(AppLocalizations.of(context)!.greeting),
      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(AppLocalizations.of(context)!.introduction),
        Wrap(children: [const Text('email: '), SelectableText(MyApp.mail)])
      ]),
      minVerticalPadding: 12,
    );
  }
}
