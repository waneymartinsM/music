import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:music_flutter/controller/login_controller.dart';
import 'package:music_flutter/routes/app_routes.dart';
import 'package:music_flutter/widgets/buttons/button_widget.dart';
import 'package:music_flutter/widgets/buttons/link_button.dart';
import 'package:music_flutter/widgets/pass_input.dart';
import 'package:music_flutter/widgets/text_input.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(12),
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Form(
                      key: controller.getFormKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextInput(
                            controller: controller.getEmailController,
                            hintText: 'Digite seu e-mail',
                            prefixIcon: FeatherIcons.mail,
                            inputType: TextInputType.emailAddress,
                            inputAction: TextInputAction.next,
                            validator: () => controller.validateEmail(),
                          ),
                          const SizedBox(height: 12),
                          PassInput(
                            hintText: 'Digite sua senha',
                            controller: controller.getPasswordController,
                            inputAction: TextInputAction.done,
                            validator: () => controller.validatePassword(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              LinkButton(
                                title: 'Esqueceu sua senha?',
                                onPressed: () => controller.resetPass(),
                              )
                            ],
                          ),
                          const SizedBox(height: 12),
                          ButtonWidget(
                            title: 'Entrar',
                            prefixIcon: FeatherIcons.logIn,
                            onPressed: () {
                              if(controller.getFormKey.currentState!.validate()){
                                controller.loginWithEmailAndPass();
                              }
                            },
                          ),
                          LinkButton(
                            title: 'Ainda não tem uma conta? Cadastra-se.',
                            onPressed: () => Get.toNamed(AppRoutes.register),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
