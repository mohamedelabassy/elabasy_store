import 'package:elabasy_store/core/app/cubit/app_cubit.dart';
import 'package:elabasy_store/core/common/animation/animation_do.dart';
import 'package:elabasy_store/core/common/widget/custom_linear_button.dart';
import 'package:elabasy_store/core/common/widget/text_app.dart';
import 'package:elabasy_store/core/extensions/context_extensions.dart';
import 'package:elabasy_store/core/language/app_localizations.dart';
import 'package:elabasy_store/core/language/lang_keys.dart';
import 'package:elabasy_store/core/style/fonts/font_with_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DarkAndLangButton extends StatelessWidget {
  const DarkAndLangButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //dark mode
        BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            return CustomFadeInRight(
              duration: 400,
              child: CustomLinearButton(
                onPressed: cubit.changeAppThemeMode,
                child: Icon(
                  cubit.isDark
                      ? Icons.light_mode_rounded
                      : Icons.dark_mode_rounded,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
        // lang
        CustomFadeInLeft(
          duration: 400,
          child: CustomLinearButton(
            onPressed: () {
              if (AppLocalizations.of(context)!.isEnLocale) {
                cubit.toArabic();
              } else {
                cubit.toEnglish();
              }
            },
            height: 44.h,
            width: 100.w,
            child: TextApp(
              text: context.translate(LangKeys.language),
              theme: context.textStyle.copyWith(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWithHelper.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
