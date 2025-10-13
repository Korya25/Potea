import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:potea_app/app/theme/app_colors.dart';
import 'package:potea_app/app/widgets/common/custom_error_widget.dart';
import 'package:potea_app/core/constants/app_assets.dart';
import 'package:potea_app/features/home/presentation/cubit/product_cubit.dart';
import 'package:potea_app/features/home/presentation/cubit/product_state.dart';

class ProductBlocBuilder extends StatelessWidget {
  const ProductBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return Center(
            child: Lottie.asset(
              AppAssets.trailLoading,
              width: 130,
              // color
              delegates: LottieDelegates(
                values: [
                  ValueDelegate.color(const ['**'], value: AppColors.primary),
                ],
              ),
            ),
          );
        } else if (state is ProductLoaded) {
          return ListView.builder(
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              final product = state.products[index];
              return Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text(product.title ?? 'Korya'),
                      subtitle: Text(product.price.toString()),
                    ),
                  ),
                  Text(state.products.length.toString()),
                ],
              );
            },
          );
        } else if (state is ProductError) {
          return Center(
            child: CustomErrorWidget(
              errorMessage: state.message!,
              onTapRetry: () => context.read<ProductCubit>()..getProducts(),
              onTapReport: () {
                // TODO : add Send report hrer
              },
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
