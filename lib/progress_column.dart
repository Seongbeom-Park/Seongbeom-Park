import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:profile/project_card.dart';
import 'package:profile/project_category.dart';

class ProjectFilter extends StatelessWidget {
  const ProjectFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Icon(Icons.filter_list_rounded),
      Flexible(
        child: Wrap(
          spacing: 2.0,
          children: ProjectCategory.values
              .map(
                (category) => category.choiceChip(),
              )
              .toList(),
        ),
      )
    ]);
  }
}

enum ProgressType {
  todo,
  progress,
  done;
}

class ProgressColumn extends StatelessWidget {
  final ProgressType type;

  const ProgressColumn.todo({super.key}) : type = ProgressType.todo;
  const ProgressColumn.progress({super.key}) : type = ProgressType.progress;
  const ProgressColumn.done({super.key}) : type = ProgressType.done;

  String getTitle() {
    // TODO: i18n
    switch (type) {
      case ProgressType.todo:
        return "계획 중";
      case ProgressType.progress:
        return "진행 중";
      case ProgressType.done:
        return "완료";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(children: [
      Text(getTitle()),
      FutureBuilder(
          future: rootBundle
              .loadString('resource/projects.json')
              .then((value) => jsonDecode(value)),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              final projects = (snapshot.data as List).where((element) {
                return element['status'] == type.name;
              });
              return Expanded(
                  child: ListView(
                      children: projects.map(
                (project) {
                  return ProjectCard.fromData(project);
                },
              ).toList()));
            }
            return Container();
          })),
    ]));
  }
}
