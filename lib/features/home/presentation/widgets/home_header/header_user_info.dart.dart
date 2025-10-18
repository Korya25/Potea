import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:potea_app/app/widgets/animations/asset_image_with_shimmer.dart';
import 'package:potea_app/app/widgets/animations/type_writer_text.dart';
import 'package:potea_app/core/utils/extensions/context_extensions.dart';
import 'package:potea_app/core/utils/extensions/text_style_extension.dart';
import 'package:potea_app/core/utils/helpers/greeting_utils.dart';
import 'package:potea_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:potea_app/features/auth/presentation/cubit/auth_state.dart';

class HeaderUserInfo extends StatelessWidget {
  const HeaderUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        ClipOval(
          child: AssetImageWithShimmer(
            height: 50,
            width: 50,
            assetPath:
                'assets/images/WhatsApp Image 2025-08-01 at 07.53.18_128e0e16.jpg',
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getGreetingMessage(),
              style: context.font14GreyW400.copyWith(fontSize: 16),
            ),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is AuthAuthenticated &&
                    state.user.name?.isNotEmpty == true) {
                  return TypeWriterText(
                    text: state.user.name!.firstAndSecondName.limit(16),
                    initialDelay: const Duration(milliseconds: 600),
                    textStyle: context.font16WhiteW300,
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ],
    );
  }
}
