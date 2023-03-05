import 'package:flutter/material.dart';
import 'package:movies/configurations/providers.dart';
import 'package:movies/router/app_routes.dart';
import 'package:movies/themes/app_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.provider(context),
      child: MaterialApp(
        title: 'Movies App',
       debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.getAppRoutes(),
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
