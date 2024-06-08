import 'package:flutter/material.dart';
import 'package:thadir_test/Home/Data/widget_list.dart';
import 'package:thadir_test/Home/Widgets/sequential_animatedlist.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SequentialAnimatedList(
          offset: const Offset(0.0, 3.0),
          duration: const Duration(seconds: 5),
          curve: Curves.linearToEaseOut,
          axis: Axis.horizontal,
          children: iconList,
        ),
      ),
    );
  }
}
