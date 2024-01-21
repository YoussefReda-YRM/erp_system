import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/erp_app.dart';
import 'package:flutter/material.dart';

void main() {
  setupServiceLocator(); // for dependency injection
  runApp(const ErpApp());
}
