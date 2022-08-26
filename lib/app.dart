import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expo/routes/app_routes.dart';

import 'common/config/app_thumb.dart';

Widget createApp() {
  return GetMaterialApp(
    initialRoute: Routes.MAIN,
    getPages: AppPages.pages,
    debugShowCheckedModeBanner: false,
    theme: theme,
  );
}
