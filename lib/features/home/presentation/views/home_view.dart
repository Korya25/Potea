import 'package:flutter/material.dart';
import 'package:potea_app/features/home/presentation/widgets/home_view_header.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Home header
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: HomeViewHeader(),
              ),
            ),

            // Body
          ],
        ),
      ),
    );
  }
}
