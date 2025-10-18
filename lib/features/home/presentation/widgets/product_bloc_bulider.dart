import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:potea_app/app/widgets/common/custom_error_widget.dart';
import 'package:potea_app/core/utils/extensions/context_extensions.dart';
import 'package:potea_app/features/home/presentation/cubit/product_cubit.dart';
import 'package:potea_app/features/home/presentation/cubit/product_state.dart';
import 'package:potea_app/features/home/presentation/widgets/header/home_view_header.dart';

class ProductBlocBulider extends StatelessWidget {
  const ProductBlocBulider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              return HomeViewHeader().skeletonizer;
            },
          );
        } else if (state is ProductLoaded) {
          return Container();
        } else if (state is ProductError) {
          return Center(
            child: CustomErrorWidget(
              errorMessage: state.message!,
              onTapRetry: () => context.read<ProductCubit>().getProducts(),
              onTapReport: () {
                // TODO :go to report
              },
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
