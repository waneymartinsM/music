import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:music_flutter/data/repository/auth_repository.dart';

void _showAlert(String message){
  Get.defaultDialog(
    title: 'Atenção!Ocorreu algum erro',
    middleText: message,
  );
}

class RegisterController extends GetxController {
  RegisterController({required this.repository});

  final AuthRepository repository;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RxString b64ProfilePic = ''.obs;
  final TextEditingController _usernameTextFieldController =
      TextEditingController();
  final TextEditingController _emailTextFieldController =
      TextEditingController();
  final TextEditingController _passwordTextFieldController =
      TextEditingController();
  final TextEditingController _confirmPassTextFieldController =
      TextEditingController();

  GlobalKey<FormState> get getFormKey => _formKey;
  TextEditingController get getUsernameController =>
      _usernameTextFieldController;
  TextEditingController get getEmailController => _emailTextFieldController;
  TextEditingController get getPasswordController =>
      _passwordTextFieldController;
  TextEditingController get getConfirmPassController =>
      _confirmPassTextFieldController;

  String? validateUsername() {
    if (getUsernameController.text.isEmpty) {
      return 'Este campo não pode estar vazio!';
    }
    return null;
  }

  String? validateEmail() {
    if (getEmailController.text.isEmpty) {
      return 'Este campo não pode estar vazio!';
    } else if (!getEmailController.text.isEmail) {
      return 'Digite o e-mail corretamente';
    }
    return null;
  }

  String? validatePassword() {
    if (getPasswordController.text.isEmpty) {
      return 'Este campo não pode estar vazio!';
    } else if (getPasswordController.text.length < 7) {
      return 'A senha deve conter no mínimo 7 caracteres';
    }
    return null;
  }

  String? validateConfirmPassword() {
    if (getConfirmPassController.text.isEmpty) {
      return 'Este campo não pode estar vazio!';
    } else if (getPasswordController.text != getConfirmPassController.text) {
      return 'As senha digitadas não conferem';
    }
    return null;
  }

  Future<void> registerWithEmailAndPassword() async {
    try{
      await repository.registerWithEmailAndPassword(getEmailController.text, getPasswordController.text, getUsernameController.text, b64ProfilePic.value,);

    } on FirebaseAuthException catch(e) {
      switch (e.code) {
        case "email-already-in-use":
          _showAlert(
            "Usuário já existente com o mesmo endereço de email. Use outro email ou faça login.",
          );
          break;
        case "operation-not-allowed":
          _showAlert(
            "Operação não permitida. Tente novamente mais tarde.",
          );
          break;
        case "invalid-email":
          _showAlert(
            "Email inválido. Verifique e tente novamente.",
          );
          break;
        case "weak-password":
          _showAlert("A senha deve conter no mínimo 08 caracteres.");
          break;
        default:
          _showAlert("${e.code} - ${e.message}");
          break;
      }
    }
  }
}
