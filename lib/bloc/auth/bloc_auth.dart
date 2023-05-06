import 'dart:convert';

import 'package:aggregator/model/auth_model.dart';
import 'package:aggregator/repository/repository_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aggregator/bloc/auth/event_auth.dart';
import 'package:aggregator/bloc/auth/state_auth.dart';

class BlocAuth extends Bloc<EventAuth, StateAuth> {
  BlocAuth() : super(StateAuthInit()) {
    RepositoryAuth _repository = new RepositoryAuth();
    on<EventAuthLogin>(
      (event, emit) async {
        emit(StateAuthLoading());
        var response =
            await _repository.login(event.username!, event.password!);
        print(response.body);
        AuthModel _authModel =
            new AuthModel.fromJson(jsonDecode(response.body));

        if (response.statusCode == 200) {
          await _repository.store_token(_authModel.token!);
          var token = await _repository.read_token();
          emit(StateAuthResponse(
              stateprogress: STATEPROGRESS.LOGGED_IN,
              code: response.statusCode,
              message: _authModel.message));
        } else {
          emit(StateAuthResponse(
              stateprogress: STATEPROGRESS.LOGGED_OUT,
              code: response.statusCode,
              message: _authModel.message));
        }
      },
    );
    on<EventAuthLogout>(
      (event, emit) async {
        await _repository.remove_token();
        var response = await _repository.check_token();
        emit(StateAuthCheckIsLoggedIn(isLoggedIn: response));
      },
    );

    on<EventAuthIsLoggedIn>(
      (event, emit) async {
        var response = await _repository.check_token();
        var token = await _repository.read_token();
        emit(StateAuthCheckIsLoggedIn(isLoggedIn: response));
      },
    );
  }
}
