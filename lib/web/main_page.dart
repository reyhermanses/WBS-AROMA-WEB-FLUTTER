import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainPageWeb extends StatefulWidget {
  MainPageWeb({this.isWeb, super.key});
  bool? isWeb;

  @override
  State<MainPageWeb> createState() => _MainPageWebState();
}

class _MainPageWebState extends State<MainPageWeb> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _username = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  bool _obsecureText = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
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
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'AGGREGATOR',
                          style: TextStyle(fontSize: 30.0, color: Colors.white),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
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
                          Container(
                            child: Image.asset(
                              'assets/logos/logo_jm.png',
                              width: 308,
                              height: 50,
                            ),
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          Row(children: <Widget>[
                            Expanded(child: Divider()),
                            Text("Mediasi JM-CLICK"),
                            Expanded(child: Divider()),
                          ]),
                          SizedBox(
                            height: 25.0,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        side: new BorderSide(
                                            color: Color.fromARGB(
                                                255, 20, 61, 155),
                                            width: .5)),
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Icon(
                                        Icons.desktop_mac_outlined,
                                        color: Color.fromARGB(255, 20, 61, 155),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        side: new BorderSide(
                                            color: Color.fromARGB(
                                                255, 104, 148, 243),
                                            width: .5)),
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Icon(
                                        Icons.laptop_chromebook,
                                        color:
                                            Color.fromARGB(255, 104, 148, 243),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        side: new BorderSide(
                                            color: Color.fromARGB(
                                                255, 14, 85, 249),
                                            width: .5)),
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Icon(
                                        Icons.badge_sharp,
                                        color: Color.fromARGB(255, 14, 85, 249),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        side: new BorderSide(
                                            color: Color.fromARGB(
                                                255, 117, 117, 117),
                                            width: .5)),
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Icon(
                                        Icons.settings,
                                        color:
                                            Color.fromARGB(255, 117, 117, 117),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
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
                                        if (value == null || value.isEmpty) {
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
                                                _obsecureText = !_obsecureText;
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
                                        if (value == null || value.isEmpty) {
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
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    child: ElevatedButton(
                                      onPressed: () => print('hallo world!'),
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
                                            style: TextStyle(fontSize: 16.0),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
