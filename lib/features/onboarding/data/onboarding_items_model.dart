import 'package:potea/core/constants/app_assets.dart';

class OnboardingItemsModel {
  final String imagePath;
  final String title;

  OnboardingItemsModel({required this.imagePath, required this.title});

  static List<OnboardingItemsModel> onboardingItemsList = [
    OnboardingItemsModel(
      imagePath: AppAssets.onboarding_1,
      title: 'We provide high quality plants just for you',
    ),
    OnboardingItemsModel(
      imagePath: AppAssets.onboarding_2,
      title: 'Your satisfaction is our number one priority',
    ),
    OnboardingItemsModel(
      imagePath: AppAssets.onboarding_3,
      title: 'Lets Shop Your Favorite Plants with Potea Now!',
    ),
  ];
}
