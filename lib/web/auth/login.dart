import 'package:aggregator/bloc/auth/bloc_auth.dart';
import 'package:aggregator/global_component.dart';
import 'package:alert_dialog/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../bloc/auth/event_auth.dart';
import '../../bloc/auth/state_auth.dart';

class Login extends StatefulWidget {
  bool? isWeb;
  bool? isLoggedIn;
  Function? storeIsLoggedIn;

  Login({this.isWeb, this.isLoggedIn, this.storeIsLoggedIn, super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _username = new TextEditingController(text: "");
  TextEditingController _password = new TextEditingController(text: "");
  bool _obsecureText = true;

  //bloc state
  BlocAuth? _blocAuth;
  bool isLoading = false;
  STATEPROGRESS _progress = STATEPROGRESS.LOGGED_OUT;

  fStateProgress(state) {
    if (state.code == 200) {
      setState(() {
        _progress = STATEPROGRESS.LOGGED_IN;
        isLoading = false;
        widget.storeIsLoggedIn!(true);
      });
    } else {
      setState(() {
        _progress = STATEPROGRESS.LOGGED_OUT;
        isLoading = false;
        widget.storeIsLoggedIn!(false);
      });
    }
    Fluttertoast.showToast(
        msg: "${state.message}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 2,
        backgroundColor:
            state.isLoggedIn == true ? Colors.greenAccent : Colors.red,
        textColor: Colors.white,
        fontSize: 18.0);
  }

  @override
  void initState() {
    // TODO: implement initState
    _blocAuth = BlocProvider.of<BlocAuth>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                color: Color.fromARGB(255, 21, 69, 139),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 20.0, bottom: 10.0),
                      child: MontserratWhite('Whistle Blowing System', 30.0),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              BlocListener<BlocAuth, StateAuth>(
                listener: (context, state) {
                  if (state is StateAuthResponse) {
                    fStateProgress(state);
                  }
                },
                child: BlocBuilder<BlocAuth, StateAuth>(
                  builder: (context, state) {
                    if (state is StateAuthLoading) {
                      return Container(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              SpinKitSpinningLines(
                                color: Color.fromARGB(255, 63, 63, 62),
                              ),
                              Montserrat('Loading...', 11.0)
                            ],
                          ),
                        ),
                      );
                    }
                    return Container(
                      child: SizedBox(
                        width: widget.isWeb!
                            ? MediaQuery.of(context).size.width
                            : MediaQuery.of(context).size.width / 3,
                        child: Card(
                          elevation: 5.5,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 15.0),
                            child: Column(
                              children: [
                                Row(children: <Widget>[
                                  Expanded(child: Divider()),
                                  Text("Login Form"),
                                  Expanded(child: Divider()),
                                ]),
                                SizedBox(
                                  height: 25.0,
                                ),
                                SizedBox(
                                  child: Form(
                                    key: _formKey,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 40.0,
                                          child: TextFormField(
                                            controller: _username,
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                contentPadding: EdgeInsets.only(
                                                    top:
                                                        20), // add padding to adjust text
                                                isDense: true,
                                                hintText: 'Enter Username',
                                                prefixIcon: Icon(
                                                  Icons.account_circle_outlined,
                                                  size: 20.0,
                                                ),
                                                prefixIconColor: Colors.black),
                                            // The validator receives the text that the user has entered.
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter username';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        SizedBox(
                                          height: 40.0,
                                          child: TextFormField(
                                            controller: _password,
                                            obscureText: _obsecureText,
                                            decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(
                                                  top:
                                                      20), // add padding to adjust text
                                              isDense: true,
                                              border: OutlineInputBorder(),
                                              hintText: 'Enter Password',
                                              prefixIcon: Padding(
                                                padding: EdgeInsets.only(
                                                    top:
                                                        2.0), // add padding to adjust icon
                                                child: Icon(
                                                  Icons.vpn_key_outlined,
                                                  size: 20.0,
                                                ),
                                              ),
                                              suffixIcon: Padding(
                                                padding: EdgeInsets.only(
                                                    top:
                                                        2.0), // add padding to adjust icon
                                                child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      _obsecureText =
                                                          !_obsecureText;
                                                    });
                                                  },
                                                  child: Icon(
                                                    _obsecureText
                                                        ? Icons.remove_red_eye
                                                        : Icons
                                                            .remove_red_eye_outlined,
                                                    size: 20.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            // The validator receives the text that the user has entered.
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter password';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 50,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                isLoading = true;
                                              });
                                              BlocProvider.of<BlocAuth>(context)
                                                  .add(EventAuthLogin(
                                                      username: _username.text
                                                          .toString(),
                                                      password: _password.text
                                                          .toString()));
                                            },
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.lock_open_outlined,
                                                  size: 20.0,
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Text(
                                                  'Login',
                                                  style:
                                                      TextStyle(fontSize: 16.0),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
