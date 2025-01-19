import 'package:elabasy_store/core/routes/app_routes.dart';
import 'package:elabasy_store/core/common/animation/animation_do.dart';
import 'package:elabasy_store/core/common/widget/text_app.dart';
import 'package:elabasy_store/core/extensions/context_extensions.dart';
import 'package:elabasy_store/core/language/lang_keys.dart';
import 'package:elabasy_store/core/style/fonts/font_with_helper.dart';
import 'package:elabasy_store/features/auth/presentation/widget/auth_title_info.dart';
import 'package:elabasy_store/features/auth/presentation/widget/dark_and_lang_button.dart';
import 'package:elabasy_store/features/auth/presentation/widget/sign_up/sign_up_button.dart';
import 'package:elabasy_store/features/auth/presentation/widget/sign_up/sign_up_text_form.dart';
import 'package:elabasy_store/features/auth/presentation/widget/sign_up/user_avtar_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // darl mode and lang
            SizedBox(height: 5.h),

            const DarkAndLangButton(),
            // welcome info
            SizedBox(height: 20.h),
            AuthTitleInfo(
              title: context.translate(LangKeys.signUp),
              description: context.translate(LangKeys.signUpWelcome),
            ),
            SizedBox(height: 10.h),
            const UserAvatarImage(),
            // user avatar
            SizedBox(height: 20.h),

            //
            SizedBox(height: 20.h),
            // sign text form
            const SignUpTextForm(),

            SizedBox(height: 20.h),
            SignUpButton(),
            // Gp to sign up
            CustomFadeInDown(
              duration: 400,
              child: TextButton(
                onPressed: () {
                  context.pushReplacementNamed(AppRoutes.login);
                },
                child: TextApp(
                  text: context.translate(LangKeys.youHaveAccount),
                  theme: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWithHelper.bold,
                    color: context.color.bluePinkLight,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
