import 'package:potea_app/app/router/app_routes.dart';
import 'package:potea_app/core/constants/app_assets.dart';

class BottomNavItem {
  final String label;
  final String iconPath;
  final String route;

  const BottomNavItem({
    required this.label,
    required this.iconPath,
    required this.route,
  });
}

class BottomNavItems {
  static List<BottomNavItem> items = [
    BottomNavItem(
      label: 'Home',
      iconPath: AppAssets.home,
      route: AppRoutes.home,
    ),
    BottomNavItem(
      label: 'Cart',
      iconPath: AppAssets.cart,
      route: AppRoutes.cart,
    ),

    BottomNavItem(
      label: 'Wallet',
      iconPath: AppAssets.wallet,
      route: AppRoutes.wallet,
    ),
    BottomNavItem(
      label: 'Profile',
      iconPath: AppAssets.profile,
      route: AppRoutes.profile,
    ),
  ];
}
