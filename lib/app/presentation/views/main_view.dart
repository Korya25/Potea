import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:potea_app/app/presentation/views/bottom_nav_item.dart';
import 'package:potea_app/app/theme/app_colors.dart';
import 'package:potea_app/core/utils/extensions/text_style_extension.dart';

class MainView extends StatelessWidget {
  final Widget child;

  const MainView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.dBackSecondary,
        selectedItemColor: AppColors.textAndIconPrimary,
        unselectedItemColor: AppColors.textAndIconGrey,
        selectedLabelStyle: context.font14PrimaryW600,
        unselectedLabelStyle: context.font14PrimaryW600.copyWith(
          color: AppColors.textAndIconGrey,
        ),
        currentIndex: _getCurrentIndex(context),
        onTap: (index) => _onTabTapped(context, index),
        items: BottomNavItems.items.map((item) {
          final isSelected = _isCurrentRoute(context, item.route);
          return BottomNavigationBarItem(
            icon: SvgPicture.asset(
              item.iconPath,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                isSelected
                    ? AppColors.textAndIconPrimary
                    : AppColors.textAndIconGrey,
                BlendMode.srcIn,
              ),
            ),
            label: item.label,
          );
        }).toList(),
      ),
    );
  }

  int _getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    for (int i = 0; i < BottomNavItems.items.length; i++) {
      final route = BottomNavItems.items[i].route;
      if (location.startsWith(route)) {
        return i;
      }
    }
    return 0;
  }

  bool _isCurrentRoute(BuildContext context, String route) {
    final location = GoRouterState.of(context).uri.path;
    return location.startsWith(route);
  }

  void _onTabTapped(BuildContext context, int index) {
    final item = BottomNavItems.items[index];
    context.goNamed(item.route);
  }
}
