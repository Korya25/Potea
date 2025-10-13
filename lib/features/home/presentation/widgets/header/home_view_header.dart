import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:potea_app/core/constants/database_keys.dart';
import 'package:potea_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:potea_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:potea_app/features/home/presentation/widgets/header/header_actions.dart.dart';
import 'package:potea_app/features/home/presentation/widgets/header/header_user_info.dart.dart';

class HomeViewHeader extends StatelessWidget {
  const HomeViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const HeaderUserInfo(),
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            final isAdmin =
                state is AuthAuthenticated &&
                state.user.role == DatabaseKeys.admin;
            return HeaderActions(isAdmin: isAdmin);
          },
        ),
      ],
    );
  }
}
