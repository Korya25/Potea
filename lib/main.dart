import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:potea/core/router/app_router.dart';
import 'package:potea/core/services/custom_bloc_observer.dart';
import 'package:potea/core/services/get_it_service.dart';
import 'package:potea/core/services/shared/shared_preferences_singleton.dart';
import 'package:potea/core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  Bloc.observer = CustomBlocObserver();

  await Prefs.init();

  setupGetit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // Themes
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: ThemeMode.system,

      // other
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
