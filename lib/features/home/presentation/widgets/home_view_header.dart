import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:potea_app/app/router/app_routes.dart';
import 'package:potea_app/app/widgets/animations/animate_do.dart';
import 'package:potea_app/app/widgets/animations/image_with_shimmer.dart';
import 'package:potea_app/app/widgets/animations/type_writer_text.dart';
import 'package:potea_app/core/utils/extensions/text_style_extension.dart';

class HomeViewHeader extends StatelessWidget {
  const HomeViewHeader({super.key});

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning ☀️';
    if (hour < 17) return 'Good Afternoon 🌤️';
    if (hour < 21) return 'Good Evening 🌙';
    return 'Good Night 🌚';
  }

  @override
  Widget build(BuildContext context) {
    final greeting = _getGreeting();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // profile image + text
        Row(
          spacing: 8,
          children: [
            ClipOval(
              child: ImageWithShimmer(
                height: 50,
                width: 50,
                imageUrl:
                    'https://scontent.fcai21-3.fna.fbcdn.net/v/t39.30808-6/503352785_1305669068227646_5784102856449242015_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=a5f93a&_nc_ohc=Imx8RS0w3mMQ7kNvwH_WdWA&_nc_oc=AdkV4ufJMowed95UJaKNkgVDqUVqpDuWiB2B0n4pm8IU1AfQpzxELKohPUj3O0YRbBo&_nc_zt=23&_nc_ht=scontent.fcai21-3.fna&_nc_gid=pjYhF1Xx5PuLsTOnLqGumg&oh=00_AfdE3kyXPZH5pwgjyYwuLqPVUQanN1v4yhXEbY3cOGLacQ&oe=68EFF6F5',
              ),
            ),

            // title  & sub
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  greeting,
                  style: context.font14GreyW400.copyWith(fontSize: 16),
                ),

                TypeWriterText(
                  text: 'Mahmoud Mohamed',
                  initialDelay: Duration(milliseconds: 600),
                  textStyle: context.font16WhiteW300.copyWith(fontSize: 16),
                ),
              ],
            ),
          ],
        ),

        // buttons (notification + favorite)
        Row(
          spacing: 16,
          children: [
            AppAnimations.slideInRight(
              delay: const Duration(milliseconds: 250),

              GestureDetector(
                onTap: () => context.pushNamed(AppRoutes.notifaction),
                child: const Icon(CupertinoIcons.bell, size: 26),
              ),
            ),
            AppAnimations.slideInRight(
              delay: const Duration(milliseconds: 450),
              GestureDetector(
                onTap: () => context.pushNamed(AppRoutes.favorite),
                child: const Icon(CupertinoIcons.heart, size: 26),
              ),
            ),

            AppAnimations.slideInRight(
              delay: const Duration(milliseconds: 450),
              GestureDetector(
                onTap: () => context.pushNamed(AppRoutes.admin),
                child: const Icon(CupertinoIcons.cloud_upload, size: 26),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
