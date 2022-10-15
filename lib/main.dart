import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:profile/progress_column.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static String home = 'https://github.com/Seongbeom-Park';
  static String mail = 'sparkamita90@gmail.com';
  static Locale? _locale;

  static set locale(Locale targetLocale) => _locale = targetLocale;
  static get supportedLocales => AppLocalizations.supportedLocales;

  const MyApp({super.key});

  // This widget is the root of your application.
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
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

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
            // const Icon(Icons.language),
            // const LanguageDropdown(),
          ],
        ),
        body: const BodyWidget());
  }
}

class LanguageDropdown extends StatelessWidget {
  const LanguageDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: Localizations.localeOf(context).toString(),
      items: const [
        DropdownMenuItem(value: 'ko', child: Text('한국어')),
        DropdownMenuItem(value: 'en', child: Text('English')),
      ],
      onChanged: (_) {},
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Introduction(),
      // const ProjectFilter(), // TODO: add filter
      Expanded(
          child: Row(
        children: const [
          ProgressColumn.todo(),
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
