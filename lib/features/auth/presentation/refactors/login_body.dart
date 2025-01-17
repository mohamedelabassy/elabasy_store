import 'package:elabasy_store/core/common/animation/animation_do.dart';
import 'package:elabasy_store/core/common/widget/text_app.dart';
import 'package:elabasy_store/core/extensions/context_extensions.dart';
import 'package:elabasy_store/core/language/lang_keys.dart';
import 'package:elabasy_store/core/style/fonts/font_with_helper.dart';
import 'package:elabasy_store/features/auth/presentation/widget/auth_title_info.dart';
import 'package:elabasy_store/features/auth/presentation/widget/dark_and_lang_button.dart';
import 'package:elabasy_store/features/auth/presentation/widget/login/login_button.dart';
import 'package:elabasy_store/features/auth/presentation/widget/login/login_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

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
            const DarkAndLangButton(),
            // welcome info
            SizedBox(height: 50.h),
            AuthTitleInfo(
              title: context.translate(LangKeys.login),
              description: context.translate(LangKeys.welcome),
            ),
            SizedBox(height: 30.h),
            // login text form
            const LoginTextForm(),
            SizedBox(height: 30.h),
            const LoginButton(),
            SizedBox(height: 30.h),

            // Gp to sign up
            CustomFadeInDown(
              duration: 400,
              child: TextApp(
                text: context.translate(LangKeys.createAccount),
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWithHelper.bold,
                  color: context.color.bluePinkLight,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
