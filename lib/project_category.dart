import 'package:flutter/material.dart';

enum ProjectCategory {
  // high-level
  publication(name: 'publication'),
  patent(name: 'patent'),
  repository(name: 'repository'),
  experience(name: 'experience'),
  study(name: 'study'),

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
  const ProjectCategory({required this.name});
  Chip chip() {
    return Chip(
      label: Text(name),
    );
  }

  ChoiceChip choiceChip() {
    return ChoiceChip(label: Text(name), selected: true);
  }
}
