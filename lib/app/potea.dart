import 'package:flutter/material.dart';
import 'package:potea_app/app/router/app_router.dart';
import 'package:potea_app/app/theme/app_theme.dart';

class PoteaApp extends StatelessWidget {
  const PoteaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // Themes
      theme: AppTheme.darkTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: ThemeMode.system,
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
