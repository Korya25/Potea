import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:potea_app/app/widgets/animations/image_with_shimmer.dart';
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
          child: ImageWithShimmer(
            height: 50,
            width: 50,
            imageUrl:
                'https://scontent.fcai21-3.fna.fbcdn.net/v/t51.82787-15/539768970_18290743882248411_1759990071500001348_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=127cfc&_nc_ohc=Q_XbCI4_Rq4Q7kNvwFb-u-Q&_nc_oc=AdmyKgrNwRyvkZMDG8NREyFSgFWgsZEh4MAnxLnqdAPK9qQWXUTLcNOXbs8oBscgru0&_nc_zt=23&_nc_ht=scontent.fcai21-3.fna&_nc_gid=JkDv5F4kF_rlEUNgXsyimQ&oh=00_Afc2UzLh12Q8dn17yKNyGUjCLM1gVF2uPhkJELDFrToe-A&oe=68F36B36',
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
