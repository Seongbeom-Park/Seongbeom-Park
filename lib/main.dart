import 'package:flutter/material.dart';
import 'package:profile/progress_column.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
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
          // TODO: change language
          // actions: const [
          //   Icon(Icons.language),
          //   LanguageDropdown(),
          // ],
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
    return const Text('''
인사말:
안녕하세요 개발자 박성범입니다''');
  }
}
