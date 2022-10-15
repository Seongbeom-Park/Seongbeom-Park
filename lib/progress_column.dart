import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  String getTitle(BuildContext context) {
    switch (type) {
      case ProgressType.todo:
        return AppLocalizations.of(context)!.todo;
      case ProgressType.progress:
        return AppLocalizations.of(context)!.progress;
      case ProgressType.done:
        return AppLocalizations.of(context)!.done;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(children: [
      Text(getTitle(context)),
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
                  return ProjectCard.fromData(context, project);
                },
              ).toList()));
            }
            return Container();
          })),
    ]));
  }
}
