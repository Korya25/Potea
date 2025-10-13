import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:potea_app/app/di/get_it_service.dart';
import 'package:potea_app/app/router/app_router.dart';
import 'package:potea_app/app/theme/app_theme.dart';
import 'package:potea_app/features/auth/presentation/cubit/auth_cubit.dart';

class PoteaApp extends StatelessWidget {
  const PoteaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthCubit>()..refreshUserData(),
      child: MaterialApp.router(
        // Themes
        theme: AppTheme.darkTheme(),
        darkTheme: AppTheme.darkTheme(),
        themeMode: ThemeMode.system,
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
