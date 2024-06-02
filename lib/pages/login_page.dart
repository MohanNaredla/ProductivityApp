import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:productivity/components/LoginComponents/input_field.dart';
import 'package:productivity/components/LoginComponents/login_header.dart';
import 'package:productivity/components/LoginComponents/forgot_password.dart';
import 'package:productivity/components/LoginComponents/login_button.dart';
import 'package:productivity/components/LoginComponents/login_icons.dart';
import 'package:productivity/components/LoginComponents/register_text.dart';
import 'package:productivity/components/LoginComponents/seperator.dart';
import 'package:productivity/utils/constants/colors.dart';
import 'package:productivity/utils/constants/sizes.dart';
import 'package:productivity/utils/helper_functions/add_size.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passController = TextEditingController();
    ValueNotifier<bool> obscure = ValueNotifier<bool>(true);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LoginHeader(headerText: "Login"),
              AddSize.addVertical(Sizes.space_between_items_xxxl),
              InputField(
                hint: "Email or Username",
                suffixIcon: const Icon(
                  CupertinoIcons.mail_solid,
                  color: AppColors.background_dark,
                ),
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                isObscure: false,
              ),
              AddSize.addVertical(Sizes.space_between_items_xl),
              ValueListenableBuilder(
                valueListenable: obscure,
                builder: (context, value, child) {
                  return InputField(
                    hint: "Password",
                    suffixIcon: InkWell(
                      onTap: () {
                        obscure.value = !obscure.value;
                      },
                      child: obscure.value
                          ? const Icon(
                              CupertinoIcons.eye_slash_fill,
                              color: AppColors.background_dark,
                            )
                          : const Icon(
                              CupertinoIcons.eye_fill,
                              color: AppColors.background_dark,
                            ),
                    ),
                    controller: passController,
                    keyboardType: TextInputType.emailAddress,
                    isObscure: obscure.value,
                  );
                },
              ),
              const ForgotPassword(),
              AddSize.addVertical(Sizes.space_between_items_lg),
              const LoginButton(),
              AddSize.addVertical(55.0),
              const Seperator(),
              AddSize.addVertical(40.0),
              const LoginIcons(),
              AddSize.addVertical(50.0),
              const RegisterText(),
            ],
          ),
        ),
      ),
    );
  }
}
