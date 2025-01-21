import 'package:elabasy_store/core/common/animation/animation_do.dart';
import 'package:elabasy_store/core/common/toast/show_toast.dart';
import 'package:elabasy_store/core/common/widget/custom_linear_button.dart';
import 'package:elabasy_store/core/common/widget/text_app.dart';
import 'package:elabasy_store/core/extensions/context_extensions.dart';
import 'package:elabasy_store/core/language/lang_keys.dart';
import 'package:elabasy_store/core/routes/app_routes.dart';
import 'package:elabasy_store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (userRole) {
            ShowToast.showToastSuccessTop(
              context: context,
              message: context.translate(LangKeys.loggedSuccessfully),
            );
            if (userRole == 'admin') {
              context.pushNamedAndRemoveUntil(AppRoutes.homeAdmin);
            } else if (userRole == 'customer') {
              context.pushNamedAndRemoveUntil(AppRoutes.homeCustomer);
            }
          },
          error: (messages) {
            ShowToast.showToastErrorTop(
              context: context,
              message: context.translate(messages),
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return CustomFadeInRight(
              duration: 600,
              child: CustomLinearButton(
                  height: 50.h,
                  width: MediaQuery.of(context).size.width,
                  onPressed: () {},
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                  )),
            );
          },
          orElse: () {
            return CustomFadeInRight(
              duration: 600,
              child: CustomLinearButton(
                height: 50.h,
                width: MediaQuery.of(context).size.width,
                onPressed: () {
                  _validateThenDoLogin(context);
                },
                child: TextApp(
                  text: context.translate(LangKeys.login),
                  theme: context.textStyle.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _validateThenDoLogin(BuildContext context) {
    if (context.read<AuthBloc>().formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(const AuthEvent.login());
    }
  }
}
