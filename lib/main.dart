import 'package:flutter/material.dart';

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
      home: const MainWidget(),
    );
  }
}

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('개발자 박성범')), body: const BodyWidget());
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Introduction(),
      const Filter(),
      Expanded(
          child: Row(
        children: const [
          Expanded(child: ProgressColumn(title: 'Todo')),
          Expanded(child: ProgressColumn(title: 'In Progress')),
          Expanded(child: ProgressColumn(title: 'Done')),
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
인사말
안녕하세요 개발자 박성범입니다''');
  }
}

class Filter extends StatelessWidget {
  const Filter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        ChoiceChip(label: Text('publication'), selected: false),
        ChoiceChip(label: Text('patent'), selected: false),
        ChoiceChip(label: Text('project'), selected: false),
      ],
    );
  }
}

class ProgressColumn extends StatelessWidget {
  final String title;

  const ProgressColumn({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        Text(title),
        const ProjectCard(
          categories: [],
        ),
      ],
    ));
  }
}

enum Category {
  publication,
  patent,
  project,
}

class ProjectCard extends StatelessWidget {
  final List<Category> categories;

  const ProjectCard({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Expanded(
          child: Row(
        children: [
          Column(
            children: const [
              Text('title'),
              Text('contents'),
              // add chips here
            ],
          )
        ],
      )),
    );
  }
}
