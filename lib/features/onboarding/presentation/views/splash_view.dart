// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:potea_app/app/router/app_routes.dart';
import 'package:potea_app/app/theme/app_colors.dart';
import 'package:potea_app/app/widgets/animations/animate_do.dart';
import 'package:potea_app/core/constants/app_assets.dart';
import 'package:potea_app/core/constants/firestore_keys.dart';
import 'package:potea_app/core/services/prefs/prefs_keys.dart';
import 'package:potea_app/core/services/prefs/shared_preferences_singleton.dart';
import 'package:potea_app/core/utils/extensions/text_style_extension.dart';

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
    Future.delayed(Duration(milliseconds: 600), () async {
      final prefs = Prefs.instance;
      final lastUid = prefs.getStringInstance(PrefKeys.lastLoggedInUid);
      final jsonString = prefs.getStringInstance(PrefKeys.userKey(lastUid));
      if (jsonString.isNotEmpty) {
        final userMap = json.decode(jsonString);
        final uid = userMap[FirestoreKeys.uid];
        if (uid != null && uid.isNotEmpty) {
          context.goNamed(AppRoutes.home);
          return;
        }
      }

      context.goNamed(AppRoutes.authGate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            // icon
            AppAnimations.fadeIn(
              delay: Duration(milliseconds: 600),
              Image.asset(AppAssets.appIcon, width: 110),
            ),

            // loading
            Column(
              children: [
                Lottie.asset(
                  AppAssets.trailLoading,
                  width: 130,
                  // color
                  delegates: LottieDelegates(
                    values: [
                      ValueDelegate.color(const [
                        '**',
                      ], value: AppColors.primary),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: Text(
                    'Please wait...',
                    style: context.font14PrimaryW600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
