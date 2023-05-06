import 'package:equatable/equatable.dart';

abstract class EventAuth extends Equatable {
  @override
  List<Object> get props => [];
}

// enum STATELOGIN { START, IS_LOGGED_IN, IS_LOGGED_OUT }
enum STATEPROGRESS { LOGGED_OUT, LOGGED_IN }

class EventAuthInit extends EventAuth {}

class EventAuthLogin extends EventAuth {
  String? username;
  String? password;

  EventAuthLogin({this.username, this.password});

  @override
  List<Object> get props => [username!, password!];
}

class EventAuthLogout extends EventAuth {}

class EventAuthIsLoggedIn extends EventAuth {}
