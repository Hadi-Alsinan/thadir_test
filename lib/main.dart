import 'package:flutter/material.dart';
import 'package:thadir_test/Home/Views/home_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
              title: 'tahdir_test',
              theme: ThemeData(
                useMaterial3: true,
              ),
              home: const HomeView(),
            ));
  }
}
