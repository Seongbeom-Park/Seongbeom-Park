import 'package:flutter/material.dart';
import 'package:profile/progress_column.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static String home = 'https://github.com/Seongbeom-Park';
  static String mail = 'sparkamita90@gmail.com';

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '개발자 박성범',
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
          title: const Text('개발자 박성범'),
          actions: [
            IconButton(
                onPressed: () => launchUrl(Uri.parse(MyApp.home)),
                // icon: const Icon(Icons.home_outlined)),
                icon: Image.asset(
                    'resource/icons/github/GitHub-Mark-Light-64px.png')),
            IconButton(
                onPressed: () => launchUrl(Uri.parse('mailto:${MyApp.mail}')),
                icon: const Icon(Icons.email_outlined)),
            // TODO: change language
            // Icon(Icons.language),
            // LanguageDropdown(),
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
      value: 'ko',
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
      // leading: Image.asset('resource/portrait.jpg'),
      // leading:
      //     CircleAvatar(backgroundImage: AssetImage('resource/portrait.jpg')),
      title: const Text('안녕하세요. 개발자 박성범입니다.'),
      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
            '''세상에 없었던 새로운 아이디어를 통해 많은 사람들에게 도움을 줄 수 있는 지속 가능한 기술 개발을 목표로 하고 있습니다.
간단한 MCU 기판 디자인부터, 임베디드 시스템, OS, 로봇, 안드로이드, iOS, 웹, 자바 어플리케이션, 빅데이터 시스템, 기계 학습까지 다양한 소프트웨어 스택에서 개발을 진행한 경험이 있습니다.
현재는 대학원 석박 통합과정을 휴학한 상태이며, 그동안 익힌 기술들을 활용하여 창업을 시도하고 있습니다.'''),
        Wrap(children: [const Text('email: '), SelectableText(MyApp.mail)])
      ]),
      minVerticalPadding: 12,
    );
  }
}
