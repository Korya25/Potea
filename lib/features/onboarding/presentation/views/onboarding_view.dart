import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:potea/core/animations/animate_do.dart';
import 'package:potea/core/constants/app_spaces.dart';
import 'package:potea/core/router/app_routes.dart';
import 'package:potea/core/widgets/common/custom_button.dart';
import 'package:potea/features/onboarding/data/onboarding_items_model.dart';
import 'package:potea/features/onboarding/presentation/widgets/custom_indicator.dart';
import 'package:potea/features/onboarding/presentation/widgets/onboarding_items.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController pageController = PageController();
  int currentPage = 0;

  void _nextPage() {
    final lastPage = OnboardingItemsModel.onboardingItemsList.length - 1;

    if (currentPage < lastPage) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
      );
    } else {
      context.goNamed(AppRoutes.authGate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppSpaces.pv24,
          child: Column(
            children: [
              Flexible(
                child: PageView.builder(
                  itemCount: OnboardingItemsModel.onboardingItemsList.length,
                  controller: pageController,
                  itemBuilder: (context, index) => OnboardingItems(
                    itemsModel: OnboardingItemsModel.onboardingItemsList[index],
                  ),
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                ),
              ),
              Padding(
                padding: AppSpaces.ph16,
                child: AppAnimations.bounceInUp(
                  delay: Duration(milliseconds: 550),
                  Column(
                    spacing: 24,
                    children: [
                      CustomIndicator(
                        totalPages:
                            OnboardingItemsModel.onboardingItemsList.length,
                        currentIndex: currentPage,
                      ),
                      CustomButton(
                        borderRadius: 24,
                        title:
                            OnboardingItemsModel.onboardingItemsList.length -
                                    1 ==
                                currentPage
                            ? 'Get Started'
                            : 'Next',
                        onTap: () => _nextPage(),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
