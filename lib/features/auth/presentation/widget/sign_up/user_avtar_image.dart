import 'package:elabasy_store/core/common/animation/animation_do.dart';
import 'package:elabasy_store/core/style/images/app_images.dart';
import 'package:elabasy_store/core/utils/image_pick.dart';
import 'package:flutter/material.dart';

class UserAvatarImage extends StatelessWidget {
  const UserAvatarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        PickImageUtils().pickImage();
      },
      child: const CustomFadeInDown(
        duration: 500,
        child: CircleAvatar(
          radius: 38,
          backgroundImage: AssetImage(AppImages.userAvatar),
        ),
      ),
    );
  }
}
