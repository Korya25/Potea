import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:potea_app/app/router/app_routes.dart';
import 'package:potea_app/app/widgets/animations/animate_do.dart';
import 'package:potea_app/app/widgets/common/custom_button.dart';
import 'package:potea_app/core/services/prefs/prefs_keys.dart';
import 'package:potea_app/core/services/prefs/shared_preferences_singleton.dart';
import 'package:potea_app/features/onboarding/data/datasource/onboarding_local_data_source.dart';
import 'package:potea_app/features/onboarding/data/repo/onboarding_repository_impl.dart';
import 'package:potea_app/features/onboarding/presentation/widgets/custom_indicator.dart';
import 'package:potea_app/features/onboarding/presentation/widgets/onboarding_items.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController pageController = PageController();
  int currentPage = 0;
  final onboardingList = OnboardingRepositoryImpl(
    OnboardingLocalDataSourceImpl(),
  ).getOnboardingItems();

  void _nextPage() {
    final lastPage = onboardingList.length - 1;

    if (currentPage < lastPage) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
      );
    } else {
      context.goNamed(AppRoutes.authGate);
      Prefs.setBool(PrefKeys.fristTimeShowOnboarding, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            child: PageView.builder(
              itemCount: onboardingList.length,
              controller: pageController,
              itemBuilder: (context, index) =>
                  OnboardingItems(itemsModel: onboardingList[index]),
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.only(left: 16, right: 16, bottom: 22),
            child: AppAnimations.bounceInUp(
              delay: Duration(milliseconds: 550),
              Column(
                spacing: 30,
                children: [
                  CustomIndicator(
                    totalPages: onboardingList.length,
                    currentIndex: currentPage,
                  ),
                  CustomButton(
                    borderRadius: 24,
                    fontSize: 16,
                    title: onboardingList.length - 1 == currentPage
                        ? 'Get Started'
                        : 'Next',
                    onTap: () => _nextPage(),
                  ),
                ],
              ),
            ),
          ),
          // SizedBox(height: 20),
        ],
      ),
    );
  }
}
