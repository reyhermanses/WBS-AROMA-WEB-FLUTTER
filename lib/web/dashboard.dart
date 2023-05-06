import 'package:aggregator/global_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Dashboard extends StatefulWidget {
  bool? isWeb;
  double? width;
  double? height;
  Dashboard({this.isWeb, this.width, this.height, super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _username = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  bool _obsecureText = true;

  bool isMenuOpen = true;
  double? sizeMenu;
  double? sizeContent;

  // List<String>? MainMenu = ;

  @override
  void initState() {
    // TODO: implement initState

    sizeMenu = widget.width! / 6;
    sizeContent = widget.width! / 1.2;

    super.initState();
  }

  showHideMenu() {
    setState(() {
      isMenuOpen = !isMenuOpen;
      if (isMenuOpen) {
        sizeMenu = widget.width! / 6;
        sizeContent = widget.width! / 1.2;
      } else {
        sizeMenu = widget.width! / 30;
        sizeContent = widget.width! - sizeMenu!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: sizeMenu,
              child: Column(
                children: [
                  SizedBox(
                    height: widget.height,
                    child: Card(
                      elevation: 2.5,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          isMenuOpen
                              ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.home_filled,
                                            size: 20,
                                            color: Color.fromARGB(
                                                255, 152, 153, 154),
                                          ),
                                          SizedBox(width: 10.0),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                  child:
                                                      Sans('Management', 15.0)),
                                              SizedBox(width: 50.0),
                                              Icon(Icons.keyboard_arrow_down,
                                                  size: 13.0),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 40),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                              child: SizedBox(
                                            width: 200,
                                            child: SansSIlver(
                                                'Data Karyawan Ap', 14.0),
                                          )),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Container(
                                              child: SizedBox(
                                            width: 200,
                                            child: SansSIlver(
                                                'Fit And Pro Karyawan', 14.0),
                                          )),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: InkWell(
                                    onTap: () => showHideMenu(),
                                    child: Icon(Icons.home_filled,
                                        size: 25,
                                        color: Color.fromARGB(255, 96, 96, 96)),
                                  ),
                                ),
                          isMenuOpen
                              ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.newspaper,
                                            size: 20,
                                            color: Color.fromARGB(
                                                255, 152, 153, 154),
                                          ),
                                          SizedBox(width: 10.0),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                  child: Sans('Report', 15.0)),
                                              SizedBox(width: 50.0),
                                              Icon(Icons.keyboard_arrow_down,
                                                  size: 13.0),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 40),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                              child: SizedBox(
                                            width: 200,
                                            child: SansSIlver(
                                                'Data Karyawan JM Group', 14.0),
                                          )),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: InkWell(
                                    onTap: () => showHideMenu(),
                                    child: Icon(Icons.newspaper,
                                        size: 25,
                                        color: Color.fromARGB(255, 96, 96, 96)),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      color: Color.fromARGB(255, 60, 68, 112),
                      // width: MediaQuery.of(context).size.width / 1.2,
                      width: sizeContent,
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => showHideMenu(),
                            child: isMenuOpen
                                ? Icon(Icons.menu,
                                    size: 25,
                                    color: Color.fromARGB(255, 254, 254, 254))
                                : Icon(Icons.arrow_forward_ios_rounded,
                                    size: 25,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          SansBoldWhite('Admin', 16.0),
                        ],
                      )),
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SansBold('Laporan', 18),
                          SizedBox(width: 10.0),
                          Sans('Laporan data karyawan JM Group', 13.0),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        child: SizedBox(
                          width: widget.width! / 1.3,
                          // height: widget.height! / 5,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            elevation: 2.5,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 100,
                                              child: Sans(
                                                  'Unit/Anak Perusahaan', 11.0),
                                            ),
                                            SizedBox(width: 5.0),
                                            SizedBox(
                                              width: widget.width! / 6,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 40.0,
                                                    child: TextFormField(
                                                      controller: _username,
                                                      decoration:
                                                          InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(),
                                                              contentPadding:
                                                                  EdgeInsets.only(
                                                                      top:
                                                                          20), // add padding to adjust text
                                                              isDense: true,
                                                              hintText:
                                                                  'Enter Username',
                                                              prefixIcon: Icon(
                                                                Icons
                                                                    .account_circle_outlined,
                                                                size: 20.0,
                                                              ),
                                                              prefixIconColor:
                                                                  Colors.black),
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
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                                width: 100,
                                                child: Sans(
                                                    'Level Karyawan', 11.0)),
                                            SizedBox(width: 5.0),
                                            SizedBox(
                                              width: widget.width! / 6,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 40.0,
                                                    child: TextFormField(
                                                      controller: _username,
                                                      decoration:
                                                          InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(),
                                                              contentPadding:
                                                                  EdgeInsets.only(
                                                                      top:
                                                                          20), // add padding to adjust text
                                                              isDense: true,
                                                              hintText:
                                                                  'Enter Username',
                                                              prefixIcon: Icon(
                                                                Icons
                                                                    .account_circle_outlined,
                                                                size: 20.0,
                                                              ),
                                                              prefixIconColor:
                                                                  Colors.black),
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
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 10.0),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                                width: 100,
                                                child: Sans(
                                                    'Keterangan AP', 11.0)),
                                            SizedBox(width: 5.0),
                                            SizedBox(
                                              width: widget.width! / 6,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 40.0,
                                                    child: TextFormField(
                                                      controller: _username,
                                                      decoration:
                                                          InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(),
                                                              contentPadding:
                                                                  EdgeInsets.only(
                                                                      top:
                                                                          20), // add padding to adjust text
                                                              isDense: true,
                                                              hintText:
                                                                  'Enter Username',
                                                              prefixIcon: Icon(
                                                                Icons
                                                                    .account_circle_outlined,
                                                                size: 20.0,
                                                              ),
                                                              prefixIconColor:
                                                                  Colors.black),
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
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 50),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 10.0),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                                width: 100,
                                                child: Sans(
                                                    'Fungsi Jabatan', 11.0)),
                                            SizedBox(width: 5.0),
                                            SizedBox(
                                              width: widget.width! / 6,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 40.0,
                                                    child: TextFormField(
                                                      controller: _username,
                                                      decoration:
                                                          InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(),
                                                              contentPadding:
                                                                  EdgeInsets.only(
                                                                      top:
                                                                          20), // add padding to adjust text
                                                              isDense: true,
                                                              hintText:
                                                                  'Enter Username',
                                                              prefixIcon: Icon(
                                                                Icons
                                                                    .account_circle_outlined,
                                                                size: 20.0,
                                                              ),
                                                              prefixIconColor:
                                                                  Colors.black),
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
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 10.0),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                                width: 100,
                                                child: Sans(
                                                    'Status Hubungan', 11.0)),
                                            SizedBox(width: 5.0),
                                            SizedBox(
                                              width: widget.width! / 6,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 40.0,
                                                    child: TextFormField(
                                                      controller: _username,
                                                      decoration:
                                                          InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(),
                                                              contentPadding:
                                                                  EdgeInsets.only(
                                                                      top:
                                                                          20), // add padding to adjust text
                                                              isDense: true,
                                                              hintText:
                                                                  'Enter Username',
                                                              prefixIcon: Icon(
                                                                Icons
                                                                    .account_circle_outlined,
                                                                size: 20.0,
                                                              ),
                                                              prefixIconColor:
                                                                  Colors.black),
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
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 10.0),
                                        child: Row(
                                          children: [
                                            SizedBox(width: 5.0),
                                            SizedBox(
                                              width: widget.width! / 6,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 40.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    child: Card(
                      elevation: 5.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Sans('List Data Karyawan', 15.0),
                              ],
                            ),
                          ),
                          Card(
                            elevation: 5.0,
                            child: SizedBox(
                              width: widget.width! / 1.3,
                              child: ListView(
                                physics: ClampingScrollPhysics(),
                                shrinkWrap: true,
                                children: [
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: DataTable(
                                      columns: const <DataColumn>[
                                        DataColumn(
                                          label: Expanded(
                                            child: Text(
                                              'No',
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Expanded(
                                            child: Text(
                                              'Npp',
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Expanded(
                                            child: Text(
                                              'Nama Karyawan',
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Expanded(
                                            child: Text(
                                              'Grade',
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Expanded(
                                            child: Text(
                                              'Unit Kerja Karyawan',
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Expanded(
                                            child: Text(
                                              'Proyeksi',
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Expanded(
                                            child: Text(
                                              'Tanggal Assesment',
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Expanded(
                                            child: Text(
                                              'Hasil Rekomendasi',
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Expanded(
                                            child: Text(
                                              'Jumlah',
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Expanded(
                                            child: Text(
                                              'Passing Grade',
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Expanded(
                                            child: Text(
                                              'Aksi',
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ),
                                        ),
                                      ],
                                      rows: const <DataRow>[
                                        DataRow(
                                          cells: <DataCell>[
                                            DataCell(Text('Sarah')),
                                            DataCell(Text('19')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                          ],
                                        ),
                                        DataRow(
                                          cells: <DataCell>[
                                            DataCell(Text('Janine')),
                                            DataCell(Text('43')),
                                            DataCell(Text('Professor')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                          ],
                                        ),
                                        DataRow(
                                          cells: <DataCell>[
                                            DataCell(Text('William')),
                                            DataCell(Text('27')),
                                            DataCell(
                                                Text('Associate Professor')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                          ],
                                        ),
                                        DataRow(
                                          cells: <DataCell>[
                                            DataCell(Text('Janine')),
                                            DataCell(Text('43')),
                                            DataCell(Text('Professor')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                          ],
                                        ),
                                        DataRow(
                                          cells: <DataCell>[
                                            DataCell(Text('William')),
                                            DataCell(Text('27')),
                                            DataCell(
                                                Text('Associate Professor')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                            DataCell(Text('Student')),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
