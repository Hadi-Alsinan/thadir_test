import 'package:flutter/material.dart';
import 'package:thadir_test/Home/Data/fetch_number.dart';
import 'package:thadir_test/Home/Widgets/icon_card.dart';

List<Widget> iconList = [
  IconTitleNumberCard(
    icon: Icons.star,
    title: 'Blue',
    backgroundColor: const Color(0xFFaeabe2),
    edgeColor: const Color(0xFF1505e2),
    numberFuture: fetchNumber(),
  ),
  IconTitleNumberCard(
    icon: Icons.square,
    backgroundColor: const Color(0xFFc9abe1),
    edgeColor: const Color(0xFFa220dd),
    title: 'Violate',
    numberFuture: fetchNumber(),
  ),
  IconTitleNumberCard(
    icon: Icons.circle,
    backgroundColor: const Color(0xFFe1b5ac),
    edgeColor: const Color(0xFFf56314),
    title: 'Orange',
    numberFuture: fetchNumber(),
  ),
];
