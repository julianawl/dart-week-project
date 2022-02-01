import 'dart:developer';
import 'package:vakinha_burger/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burger/app/models/user_model.dart';
import 'package:vakinha_burger/app/repositories/auth/auth_repository.dart';

import 'user_notfound_exception.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RestClient _restClient;

  AuthRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<UserModel> register(String name, String email, String password) async {
    final result = await _restClient.post('/auth/register', {
      'name': name,
      'email': email,
      'password': password,
    });

    if (result.hasError) {
      var message = 'Erro ao registar usuário';
      if (result.statusCode == 400) {
        message = result.body['error'];
      }

      log(message, error: result.statusText, stackTrace: StackTrace.current);

      throw RestClientException(message);
    }

    return login(email, password);
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final result = await _restClient.post('/auth/', {
      'email': email,
      'password': password,
    });

    if (result.hasError) {
      if (result.statusCode == 403) {
        log('usuario ou senha invalidos',
            error: result.statusText, stackTrace: StackTrace.current);

        throw UserNotFoundException();
      }

      log(
        'Erro ao autenticar o usuário (${result.statusCode})',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException('Erro ao autenticar usuário');
    }

    return UserModel.fromMap(result.body);
  }
}
