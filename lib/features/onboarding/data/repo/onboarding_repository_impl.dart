import 'package:potea_app/features/onboarding/data/datasource/onboarding_local_data_source.dart';
import 'package:potea_app/features/onboarding/data/models/onboarding_model.dart';

abstract class OnboardingRepository {
  List<OnboardingModel> getOnboardingItems();
}

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingLocalDataSource localDataSource;

  OnboardingRepositoryImpl(this.localDataSource);

  @override
  List<OnboardingModel> getOnboardingItems() {
    return localDataSource.getOnboardingItems();
  }
}
