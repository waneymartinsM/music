import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_flutter/data/repository/auth_repository.dart';

void _showAlert(String message) {
  Get.defaultDialog(
    title: 'Atenção!Ocorreu algum erro.',
    middleText: message,
    barrierDismissible: true,
    textConfirm: 'Ok',
    onConfirm: () => Get.back(),
  );
}

class LoginController extends GetxController {
  LoginController({required this.repository});

  final AuthRepository repository;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextFieldController =
      TextEditingController();
  final TextEditingController _passwordTextFieldController =
      TextEditingController();

  GlobalKey<FormState> get getFormKey => _formKey;
  TextEditingController get getEmailController => _emailTextFieldController;
  TextEditingController get getPasswordController =>
      _passwordTextFieldController;

  String? validateEmail() {
    if (getEmailController.text.isEmpty) {
      return 'Este campo não pode está vazio!';
    } else if (!getEmailController.text.isEmail) {
      return 'Digite o e-mail corretamente.';
    }
    return null;
  }

  String? validatePassword() {
    if (getPasswordController.text.isEmpty) {
      return 'Este campo não pode está vazio!';
    } else if (getPasswordController.text.length < 7) {
      return 'A senha deve conter no mínimo 7 caracteres.';
    }
    return null;
  }

  Future<void> loginWithEmailAndPass() async {
    try {
      await repository.loginWithEmailAndPassword(
          getEmailController.text, getPasswordController.text);
    } on FirebaseException catch (e) {
      switch (e.code) {
        case "invalid-email":
          _showAlert("Email ou senha inválidos. Verifique e tente novamente.");
          break;
        case "user-disabled":
          _showAlert("Este usuário está desabilitado.");
          break;
        case "user-not-found":
          _showAlert(
              "Usuário não encontrado. Verifique se você já tem cadastro.");
          break;
        case "wrong-password":
          _showAlert("Email ou senha inválidos. Verifique e tente novamente.");
          break;
        default:
          _showAlert("${e.code} - ${e.message}");
          break;
      }
    }
  }

  Future<void> loginWithApple() async {
    repository.loginWithApple();
  }

  Future<void> logOut() async {
    await repository.logOut();
  }

  void resetPass() {}
}
