import 'package:flutter/material.dart';
import 'package:mywiki/src/app.dart';
import 'package:mywiki/src/service/di/app_di_service.dart';

void main() {
  AppDependencyInjectionService.getInstance().init();
  runApp(const MyWikiApp());
}
