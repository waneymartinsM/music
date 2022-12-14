import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:music_flutter/controller/register_controller.dart';
import 'package:music_flutter/widgets/buttons/button_widget.dart';
import 'package:music_flutter/widgets/image_pick.dart';
import 'package:music_flutter/widgets/pass_input.dart';
import 'package:music_flutter/widgets/text_input.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          ImagePick(
                            controller: controller,
                          ),
                          const SizedBox(height: 12),
                          TextInput(
                            hintText: 'Digite seu nome',
                            controller: controller.getUsernameController,
                            prefixIcon: FeatherIcons.user,
                            inputType: TextInputType.name,
                            inputAction: TextInputAction.next,
                            validator: () => controller.validateUsername(),
                          ),
                          const SizedBox(height: 12),
                          TextInput(
                            hintText: 'Digite seu e-mail',
                            controller: controller.getEmailController,
                            prefixIcon: FeatherIcons.mail,
                            inputType: TextInputType.emailAddress,
                            inputAction: TextInputAction.next,
                            validator: () => controller.validateEmail(),
                          ),
                          const SizedBox(height: 12),
                          PassInput(
                            hintText: 'Digite uma senha',
                            controller: controller.getPasswordController,
                            inputAction: TextInputAction.next,
                            validator: () => controller.validatePassword(),
                          ),
                          const SizedBox(height: 12),
                          PassInput(
                            hintText: 'Digite a senha novamente',
                            controller: controller.getConfirmPassController,
                            inputAction: TextInputAction.done,
                            validator: () =>
                                controller.validateConfirmPassword(),
                          ),
                          const SizedBox(height: 12),
                          ButtonWidget(
                            title: 'Criar conta',
                            prefixIcon: FeatherIcons.logIn,
                            onPressed: () {
                              if (controller.getFormKey.currentState!
                                  .validate()) {
                                controller.registerWithEmailAndPassword();
                              }
                            },
                          ),
                          const SizedBox(height: 12),
                          ButtonWidget(
                            title: 'Voltar',
                            color: ButtonColors.secondary,
                            prefixIcon: Icons.arrow_back,
                            onPressed: () => Get.back(),
                          )
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
