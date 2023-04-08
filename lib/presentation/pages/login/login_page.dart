import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/util/helpers/icon_paths.dart';
import '../../global_widgets/global_gradient_button_widget.dart';
import 'controllers/login_controller.dart';
import 'widgets/login_secondary_methods_button_widget.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            reverse: true,
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Bem vinde ao teste prático do Daniel Marciano',
                          style: Get.textTheme.titleSmall,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(
                              RegExp(r'\s'),
                            ),
                          ],
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.emailController,
                          decoration: InputDecoration(
                            hintText: 'seumelhor@email.com',
                            hintStyle: Get.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Obx(
                          () => TextFormField(
                            onFieldSubmitted: (value) {
                              controller.submitLogin();
                            },
                            controller: controller.passwordController,
                            obscureText: !controller.showPassword.value,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              suffixIcon: InkWell(
                                onTap: controller.switchShowPassword,
                                child: controller.showPassword.value
                                    ? const Icon(Icons.visibility_off_outlined)
                                    : const Icon(Icons.visibility_outlined),
                              ),
                              hintText: 'sua senha',
                              hintStyle: Get.textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 25),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Esqueci minha senha',
                                textAlign: TextAlign.right,
                                style: Get.textTheme.bodySmall?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GlobalGradientButtonWidget(
                      buttonText: 'ENTRAR',
                      onTapButton: controller.submitLogin,
                    ),
                    const Spacer(flex: 2),
                    const Padding(
                      padding: EdgeInsets.all(30),
                      child: Text('ou entre com'),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: LoginSecondaryMethodsButtonWidget(
                              iconPath: IconPaths.GOOGLE,
                              onTap: controller.submitGoogleLogin),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: LoginSecondaryMethodsButtonWidget(
                              iconPath: IconPaths.FACEBOOK, onTap: () {}),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
