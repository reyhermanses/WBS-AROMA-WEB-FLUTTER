import 'package:aggregator/bloc/auth/bloc_auth.dart';
import 'package:aggregator/bloc/auth/event_auth.dart';
import 'package:aggregator/global_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alert_dialog/alert_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../bloc/auth/state_auth.dart';
import 'reports/post.dart';

class Dashboard2 extends StatefulWidget {
  bool? isLoggedIn;
  Function? storeIsLoggedIn;
  Dashboard2({this.isLoggedIn, this.storeIsLoggedIn, super.key});

  @override
  State<Dashboard2> createState() => _Dashboard2State();
}

class _Dashboard2State extends State<Dashboard2> {
  double barLeftWidth = 0;
  double barRightWidth = 0;

  BlocAuth? _blocAuth;
  bool isLoading = false;
  STATEPROGRESS _progress = STATEPROGRESS.LOGGED_OUT;

  fStateProgress(state) {
    if (state.code == 200) {
      setState(() {
        print(state.message);
        _progress = STATEPROGRESS.LOGGED_IN;
        isLoading = false;
        widget.storeIsLoggedIn!(state.isLoggedIn);
      });
    } else {
      setState(() {
        print(state.message);
        _progress = STATEPROGRESS.LOGGED_OUT;
        isLoading = false;
        widget.storeIsLoggedIn!(false);
      });
    }
    setState(() {
      Fluttertoast.showToast(
          msg: "${state.message}",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2,
          backgroundColor:
              state.status == true ? Colors.greenAccent : Colors.red,
          textColor: Colors.white,
          fontSize: 18.0);
    });
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
    print(width);
    print(height);
    barLeftWidth = width / 5;
    barRightWidth = width - barLeftWidth;
    print(barLeftWidth);
    print(barRightWidth);
    print(barLeftWidth + barRightWidth);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 43, 83, 147),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 210, 208, 208).withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        width: width,
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 50, 49, 49).withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          width: width,
          height: height,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      width: barLeftWidth,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 5.0),
                                alignment: Alignment.center,
                                width: width * 0.2,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 43, 83, 147),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 112, 111, 111)
                                          .withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(
                                          0, 1), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: MontserratBoldWhite('WBS', 35.0)),
                            SizedBox(height: 50),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              alignment: Alignment.center,
                              width: width * 0.2,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 43, 83, 147),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 112, 111, 111)
                                        .withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.home,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 15.0),
                                  MontserratWhite('Dashboard', 18.0),
                                ],
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              alignment: Alignment.center,
                              width: width * 0.2,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 43, 83, 147),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 112, 111, 111)
                                        .withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.report_problem,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 15.0),
                                  MontserratWhite('Reports', 18.0),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              alignment: Alignment.center,
                              width: width * 0.2,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 43, 83, 147),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 112, 111, 111)
                                        .withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.settings,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 15.0),
                                  MontserratWhite('Settings', 18.0),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height * 0.3,
                            ),
                            BlocListener<BlocAuth, StateAuth>(
                                listener: (context, state) {
                              if (state is StateAuthResponse) {
                                fStateProgress(state);
                              }
                            }, child: BlocBuilder<BlocAuth, StateAuth>(
                                    builder: ((context, state) {
                              if (state is StateAuthLoading) {
                                return Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: [
                                        SpinKitSpinningLines(
                                          color:
                                              Color.fromARGB(255, 63, 63, 62),
                                        ),
                                        Montserrat('Loading...', 11.0)
                                      ],
                                    ),
                                  ),
                                );
                              }

                              return InkWell(
                                onTap: () {
                                  _blocAuth!.add(EventAuthLogout());
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10.0),
                                  alignment: Alignment.center,
                                  width: width * 0.2,
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 112, 111, 111)
                                                .withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: Offset(
                                            0, 1), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.logout,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 15.0),
                                      MontserratWhite('Logout', 18.0),
                                    ],
                                  ),
                                ),
                              );
                            })))
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 233, 231, 231),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        width: barRightWidth,
                        height: height,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: width / 5,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        // color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      // child: TextField(
                                      //   decoration: InputDecoration(
                                      //     prefixIcon: Icon(Icons.search),
                                      //     border: OutlineInputBorder(
                                      //         borderRadius: BorderRadius.all(
                                      //             Radius.circular(15))),
                                      //     hintText: 'Search',
                                      //   ),
                                      // ),
                                    ),
                                    // Container(
                                    //     decoration: BoxDecoration(
                                    //       color: Colors.redAccent,
                                    //       borderRadius:
                                    //           BorderRadius.circular(15),
                                    //     ),
                                    //     padding: EdgeInsets.symmetric(
                                    //         vertical: 10.0, horizontal: 10.0),
                                    //     child: MontserratWhite('Log out', 15.0))
                                  ],
                                ),
                                SizedBox(height: 50),
                                PostReport()
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
