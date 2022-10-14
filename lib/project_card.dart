import 'package:flutter/material.dart';
import 'package:profile/project_category.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final List<ProjectCategory> categories;
  final String url;

  const ProjectCard(
      {super.key,
      required this.title,
      required this.description,
      required this.categories,
      String? url})
      : url = url ?? '';

  factory ProjectCard.fromData(Map data) {
    readData(String key, {String? language}) {
      if (!data.containsKey(key)) return '';
      if (data[key] is Map) {
        language ??= 'ko';
        return data[key][language];
      }
      return data[key];
    }

    return ProjectCard(
        title: readData('title'),
        description: readData('description'),
        categories: (readData('categories') as List)
            .map((category) => ProjectCategory.values.byName(category))
            .toList(),
        url: readData('link'));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(children: [
      ListTile(
        leading: categories.first.icon,
        title: Text(title, softWrap: false, overflow: TextOverflow.ellipsis),
        subtitle:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(description, overflow: TextOverflow.ellipsis, maxLines: 2),
          Wrap(
              spacing: 3,
              runSpacing: 3,
              children: categories.map((category) {
                return category.chip();
              }).toList())
        ]),
        isThreeLine: true,
        dense: true,
        onTap: () {
          if (url.isNotEmpty) launchUrl(Uri.parse(url));
          // TODO: open dialog
        },
      ),
    ]));
  }
}
