import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burger/app/core/contants/constants.dart';
import 'package:vakinha_burger/app/core/mixins/loader_mixin.dart';
import 'package:vakinha_burger/app/core/mixins/messages_mixin.dart';
import 'package:vakinha_burger/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burger/app/repositories/auth/auth_repository.dart';
import 'package:vakinha_burger/app/repositories/auth/user_notfound_exception.dart';

class LoginController extends GetxController
    with LoaderMixin, MessagesMixin {
  final AuthRepository _authRepository;
  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  LoginController({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  void onInit() {
    loaderListener(_loading);
    messageListener(_message);
    super.onInit();
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      _loading.toggle();
      final userLogged = await _authRepository.login(email, password);
      final storage = GetStorage();
      storage.write(Constants.USER_KEY, userLogged.id);

      _loading.toggle();
      Get.back();
      _message(MessageModel(
        title: 'Sucesso!',
        message: 'Cadastro realizado com sucesso',
        type: MessageType.info,
      ));
    } on UserNotFoundException catch (e, s) {
      _loading.toggle();
      log('Erro ao efetuar login', error: e, stackTrace: s);
      _message(MessageModel(
        title: 'Erro',
        message: 'Login ou senha inválidos',
        type: MessageType.error,
      ));
    } catch (e, s) {
      _loading.toggle();
      log('Erro ao efetuar login', error: e, stackTrace: s);
      _message(
        MessageModel(
            title: 'Erro',
            message: 'Erro ao efetuar login',
            type: MessageType.error),
      );
    }
  }
}