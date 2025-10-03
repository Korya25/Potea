import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:potea/core/router/app_routes.dart';
import 'package:potea/features/splash/presentation/widgets/unessential_splash_view_body.dart';

class UnessentialSplashView extends StatefulWidget {
  const UnessentialSplashView({super.key});

  @override
  State<UnessentialSplashView> createState() => _UnessentialSplashViewState();
}

class _UnessentialSplashViewState extends State<UnessentialSplashView> {
  @override
  void initState() {
    super.initState();
    // navigat
    Future.delayed(Duration(milliseconds: 4200), () {
      if (mounted) {
        context.goNamed(AppRoutes.onboarding);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: UnessentialSplashViewBody()));
  }
}
