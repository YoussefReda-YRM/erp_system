import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/erp_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  setupServiceLocator(); // for dependency injection
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent
  ));
  await ScreenUtil.ensureScreenSize();
  runApp(const ErpApp());
}
