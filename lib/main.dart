import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:potea_app/core/router/app_router.dart';
import 'package:potea_app/core/services/bloc/custom_bloc_observer.dart';
import 'package:potea_app/core/services/getit/get_it_service.dart';
import 'package:potea_app/core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  Bloc.observer = CustomBlocObserver();
  await setupGetit();

  runApp(const PoteaApp());
}

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
