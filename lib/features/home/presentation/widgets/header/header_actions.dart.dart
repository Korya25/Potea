import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:potea_app/app/router/app_routes.dart';
import 'package:potea_app/app/widgets/animations/animate_do.dart';

class HeaderActions extends StatelessWidget {
  final bool isAdmin;
  const HeaderActions({super.key, required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppAnimations.slideInRight(
          delay: const Duration(milliseconds: 250),
          GestureDetector(
            onTap: () => context.pushNamed(AppRoutes.notifaction),
            child: const Icon(CupertinoIcons.bell, size: 26),
          ),
        ),
        const SizedBox(width: 16),
        AppAnimations.slideInRight(
          delay: const Duration(milliseconds: 450),
          GestureDetector(
            onTap: () => context.pushNamed(AppRoutes.favorite),
            child: const Icon(CupertinoIcons.heart, size: 26),
          ),
        ),
        if (isAdmin) ...[
          const SizedBox(width: 16),
          AppAnimations.slideInRight(
            delay: const Duration(milliseconds: 600),
            GestureDetector(
              onTap: () => context.pushNamed(AppRoutes.admin),
              child: const Icon(CupertinoIcons.cloud_upload, size: 26),
            ),
          ),
        ],
      ],
    );
  }
}
