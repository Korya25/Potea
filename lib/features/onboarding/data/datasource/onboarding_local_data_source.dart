import 'package:potea_app/core/constants/app_assets.dart';
import 'package:potea_app/features/onboarding/data/models/onboarding_model.dart';

abstract class OnboardingLocalDataSource {
  List<OnboardingModel> getOnboardingItems();
}

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  @override
  List<OnboardingModel> getOnboardingItems() {
    return [
      OnboardingModel(
        imagePath: AppAssets.onboarding1,
        title: 'We provide high quality plants just for you',
      ),
      OnboardingModel(
        imagePath: AppAssets.onboarding2,
        title: 'Your satisfaction is our number one priority',
      ),
      OnboardingModel(
        imagePath: AppAssets.onboarding3,
        title: 'Lets Shop Your Favorite Plants with Potea Now!',
      ),
    ];
  }
}
