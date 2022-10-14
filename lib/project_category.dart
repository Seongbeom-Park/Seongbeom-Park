import 'package:flutter/material.dart';

enum ProjectCategory {
  // high-level
  publication(name: 'publication', icon: Icon(Icons.article)),
  patent(name: 'patent', icon: Icon(Icons.lightbulb)),
  repository(name: 'repository', icon: Icon(Icons.storage_rounded)),
  experience(name: 'experience', icon: Icon(Icons.person)),
  study(name: 'study', icon: Icon(Icons.battery_2_bar_rounded)),

  // framwork
  tensorflow(name: 'tensorflow'),
  react(name: 'react'),
  reactNative(name: 'react native'),
  spark(name: 'spark'),
  bigdata(name: 'bigdata'),

  // platform
  android(name: 'android'),
  ios(name: 'ios'),
  web(name: 'web'),
  embedded(name: 'embedded'),
  riscv(name: 'riscv'),
  ;

  final String name;
  final Icon icon;
  const ProjectCategory({required this.name, Icon? icon})
      : icon = icon ?? const Icon(Icons.article);
  Chip chip() {
    return Chip(
      label: Text(name),
    );
  }

  ChoiceChip choiceChip() {
    return ChoiceChip(label: Text(name), selected: true);
  }
}
