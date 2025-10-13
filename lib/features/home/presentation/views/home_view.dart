import 'package:flutter/material.dart';
import 'package:potea_app/app/theme/app_colors.dart';
import 'package:potea_app/features/home/presentation/widgets/header/home_view_header.dart';
import 'package:potea_app/features/home/presentation/widgets/product_bloc_bulider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.dBackPrimary,
        title: HomeViewHeader(),
      ),
      body: ProductBlocBuilder(),
    );
  }
}
