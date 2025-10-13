import 'package:flutter/material.dart';
import 'package:potea_app/app/widgets/common/custom_button.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(onTap: () {}, child: const Text('Log Out'));
  }
}
