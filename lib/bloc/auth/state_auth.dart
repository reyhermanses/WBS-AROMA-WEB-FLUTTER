import 'package:aggregator/bloc/auth/event_auth.dart';
import 'package:equatable/equatable.dart';

abstract class StateAuth extends Equatable {
  @override
  List<Object> get props => [];
}

class StateAuthInit extends StateAuth {}

class StateAuthLoading extends StateAuth {}

class StateAuthResponse extends StateAuth {
  STATEPROGRESS? stateprogress;
  String? message;
  int? code;
  int? isLoggedIn;
  String? token;

  StateAuthResponse(
      {this.stateprogress,
      this.message,
      this.code,
      this.isLoggedIn,
      this.token});

  @override
  List<Object> get props =>
      [stateprogress!, message!, code!, isLoggedIn!, token!];
}

class StateAuthCheckIsLoggedIn extends StateAuth {
  bool? isLoggedIn;

  StateAuthCheckIsLoggedIn({this.isLoggedIn});

  @override
  List<Object> get props => [isLoggedIn!];
}
