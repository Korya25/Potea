import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:potea/core/router/app_routes.dart';
import 'package:potea/features/splash/presentation/widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    // navigat
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        context.goNamed(AppRoutes.authGate);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: SplashViewBody()));
  }
}
