import 'package:flutter/material.dart';
import 'package:flutter_test1/core/theme.dart';
import 'home/home_view_model.dart';
import 'package:get/get.dart';

import 'home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class ABinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeModelView>(() => HomeModelView());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: MyTheme.theme,
      debugShowCheckedModeBanner: false,
      fallbackLocale: const Locale('en', 'US'),
      locale: const Locale('fa', 'IR'),
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomeView(),
          binding: ABinding(),
        ),
      ],
      initialRoute: '/',
    );
  }
}
