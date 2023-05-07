import 'package:aggregator/bloc/auth/bloc_auth.dart';
import 'package:aggregator/bloc/auth/event_auth.dart';
import 'package:aggregator/bloc/reports/bloc_report.dart';
import 'package:aggregator/global_component.dart';
import 'package:aggregator/web/auth/login.dart';
import 'package:aggregator/web/dashboard2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'bloc/auth/state_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool isWeb = false;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Whistleblowing System',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (BuildContext context) => BlocAuth()),
            BlocProvider(create: (BuildContext context) => BlocReport()),
          ],
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                isWeb = false;
              } else {
                isWeb = true;
              }
              return AuthInitializer(
                isWeb: isWeb,
              );
              ;
            },
          ),
        ));
  }
}

class AuthInitializer extends StatefulWidget {
  bool? isWeb;
  AuthInitializer({this.isWeb, super.key});

  @override
  State<AuthInitializer> createState() => _AuthInitializerState();
}

class _AuthInitializerState extends State<AuthInitializer> {
  bool isLoggedIn = false;
  bool isLoading = true;
  BlocAuth? _blocAuth;
  @override
  void initState() {
    // TODO: implement initState
    _blocAuth = BlocProvider.of<BlocAuth>(context);
    _blocAuth!.add(EventAuthIsLoggedIn());

    super.initState();
  }

  void fStateLogin(stateLogin) {
    setState(() {
      isLoggedIn = stateLogin;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;
    return BlocListener<BlocAuth, StateAuth>(
      listener: (context, state) {
        if (state is StateAuthInit) {}
        if (state is StateAuthCheckIsLoggedIn) {
          fStateLogin(state.isLoggedIn!);
        }
      },
      child: !isLoading
          ? isLoggedIn
              ? Dashboard2()
              : Login(
                  isWeb: widget.isWeb,
                  isLoggedIn: isLoggedIn,
                  storeIsLoggedIn: (value) => fStateLogin(value),
                )
          : Container(
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
            ),
    );
  }
}
