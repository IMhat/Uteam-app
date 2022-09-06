import 'package:app_uteam/screens/home.dart';
import 'package:app_uteam/screens/home1.dart';
import 'package:app_uteam/screens/product_details.dart';
import 'package:app_uteam/services/image_services.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:app_uteam/providers/task_list_provider.dart';
import 'package:app_uteam/providers/product_list_provider.dart';
import 'package:app_uteam/providers/point_list_provider.dart';
import 'package:app_uteam/providers/user_list_provider.dart';
import 'package:app_uteam/router/app_routes.dart';
import 'package:app_uteam/services/task_services.dart';
import 'package:app_uteam/services/product_services.dart';
import 'package:app_uteam/services/points_service.dart';
import 'package:app_uteam/services/user_services.dart';
import 'package:app_uteam/themes/app_theme.dart';
import 'package:provider/provider.dart';


void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskService()),
        ChangeNotifierProvider(create: (_) => ProductService()),
        ChangeNotifierProvider(create: (_) => PointService()),
        ChangeNotifierProvider(create: (_) => TaskListProvider()),
        ChangeNotifierProvider(create: (_) => ProductListProvider()),
        ChangeNotifierProvider(create: (_) => PointListProvider()),
        ChangeNotifierProvider(create: (_) => UserListProvider()),
        ChangeNotifierProvider(create: (_) => UserService()),
        ChangeNotifierProvider(create: (_) => ImageServices()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // localizationsDelegates: const [
        //   GlobalCupertinoLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalMaterialLocalizations.delegate,
        //   S.delegate,
        // ],
        // supportedLocales: S.delegate.supportedLocales,
        //title: S.of(context).simpleText,
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.getAppRoutes(),
        theme: AppTheme.lightTheme,
        home: HomePage1());
  }
}

Future<Response> sendFile(String url, File file) async {
  Dio dio = Dio();
  var len = await file.length();
  var response = await dio.put(url,
      data: file.openRead(),
      options: Options(headers: {
        Headers.contentLengthHeader: len,
      } // set content-length
          ));
  return response;
}
