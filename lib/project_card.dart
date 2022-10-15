import 'package:flutter/material.dart';
import 'package:profile/project_category.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  factory ProjectCard.fromData(BuildContext context, Map data) {
    readData(String key) {
      if (!data.containsKey(key)) return '';
      if (data[key] is Map) {
        return data[key][Localizations.localeOf(context).toString()];
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ListTile(
        leading: categories.first.icon,
        title: Text(title.replaceAll('', '\u{200B}'),
            softWrap: false, overflow: TextOverflow.ellipsis),
        subtitle: Text(description.replaceAll('', '\u{200B}'),
            overflow: TextOverflow.ellipsis, maxLines: 2),
        dense: true,
        minLeadingWidth: 0.1,
        onTap: () {
          if (url.isNotEmpty) launchUrl(Uri.parse(url));
          // TODO: open dialog
        },
      ),
      Padding(
        padding: const EdgeInsets.all(4),
        child: Wrap(
            spacing: 3,
            runSpacing: 3,
            children: categories.map((category) {
              return category.chip();
            }).toList()),
      )
    ]));
  }
}
