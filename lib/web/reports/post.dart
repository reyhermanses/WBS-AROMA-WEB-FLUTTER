import 'package:aggregator/bloc/reports/bloc_report.dart';
import 'package:aggregator/bloc/reports/event_report.dart';
import 'package:aggregator/bloc/reports/state_report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alert_dialog/alert_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../global_component.dart';

class PostReport extends StatefulWidget {
  const PostReport({super.key});

  @override
  State<PostReport> createState() => _PostReportState();
}

class _PostReportState extends State<PostReport> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _reportNumber = TextEditingController(text: "");
  TextEditingController _name = TextEditingController(text: "");
  TextEditingController _title = TextEditingController(text: "");
  TextEditingController _description = TextEditingController(text: "");
  BlocReport? _blocReport;
  bool? isLoadingPost;
  String? message;
  bool? isAdd;

  double barLeftWidth = 0;
  double barRightWidth = 0;

  postState(state) {
    setState(() {
      message = state.message;
      isLoadingPost = false;
    });
  }

  reportToggle() {
    setState(() {
      isAdd = !isAdd!;
      if (isAdd == true) {
        BlocProvider.of<BlocReport>(context).add(EventReportList());
      }
    });
  }

  fListData() {
    _blocReport!.add(EventReportList());
  }

  fDeleteData(id) async {
    _blocReport!.add(
      EventReportDelete(id: int.parse(id)),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    _blocReport = BlocProvider.of<BlocReport>(context);
    fListData();
    isLoadingPost = false;
    isAdd = true;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(isLoadingPost);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    barLeftWidth = width / 5;
    barRightWidth = width - barLeftWidth;
    return BlocListener<BlocReport, StateReport>(
      listener: ((context, state) {
        if (state is StateReportPostResponse) {
          // alert(context, title: Text('${state.message}'));
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
      }),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amberAccent,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 112, 111, 111).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: MontserratBoldBlue('Reports', 23.0),
                ),
                InkWell(
                  onTap: () => reportToggle(),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    alignment: Alignment.center,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.green.shade600,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 112, 111, 111)
                              .withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Icon(
                      !isAdd! ? Icons.remove_circle_outline : Icons.add,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            !isAdd! ? WPost(width) : WList(width),
          ],
        ),
      ),
    );
  }

  Widget WList(width) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color.fromARGB(255, 43, 83, 147),
      ),
      child: Card(
        color: Color.fromARGB(255, 43, 83, 147),
        elevation: 5.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MontserratWhite('List Data Reports', 15.0),
                ],
              ),
            ),
            Card(
              elevation: 5.0,
              child: SizedBox(
                width: width! / 1.3,
                child: BlocBuilder<BlocReport, StateReport>(
                    builder: ((context, state) {
                  if (state is StateReportLoading) {
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
                  // if (state is StateReportInit) {}
                  if (state is StateReportPostResponse) {
                    return ListView(
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
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Name',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Alias',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Title',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'description',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'status',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'anonymous',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'information',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'action',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                            ],
                            rows: state.reportListModel!.data!.map((element) {
                              var name =
                                  element.name != null ? element.name : "-";
                              var alias =
                                  element.alias != null ? element.alias : "-";
                              var title =
                                  element.title != null ? element.title : "-";
                              var description = element.description != null
                                  ? element.description
                                  : "-";
                              var status =
                                  element.status != null ? element.status : "-";
                              var anonymous = element.anonymous != null
                                  ? element.anonymous
                                  : "-";
                              var information = element.description != null
                                  ? element.description
                                  : "-";
                              return DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('${element.id}')),
                                  DataCell(Text('${name}')),
                                  DataCell(Text('${alias}')),
                                  DataCell(Text('${title}')),
                                  DataCell(Text('${description}')),
                                  DataCell(Text('${status}')),
                                  DataCell(Text('${anonymous}')),
                                  DataCell(Text('${information}')),
                                  DataCell(new Row(
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors
                                              .redAccent, // Background color
                                        ),
                                        onPressed: () =>
                                            fDeleteData(element.id!),
                                        child:
                                            MontserratBoldWhite('Delete', 15.0),
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color.fromARGB(255,
                                              8, 148, 241), // Background color
                                        ),
                                        onPressed: () {},
                                        child:
                                            MontserratBoldWhite('Edit', 15.0),
                                      ),
                                    ],
                                  ))
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    );
                  }
                  return Container(
                    child:
                        MontserratBoldBlue('Report data is unvailable', 20.0),
                  );
                })),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget WPost(width) {
    return BlocBuilder<BlocReport, StateReport>(builder: (context, state) {
      if (state is StateReportLoading) {
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
        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
        width: barRightWidth,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 43, 83, 147),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 112, 111, 111).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                      width: width / 15,
                      child: MontserratWhite('Nomor Laporan', 15.0)),
                  Container(
                    width: width / 5,
                    height: 45,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      controller: _reportNumber,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Report Number cannot be null';
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Row(
                children: [
                  Container(
                      width: width / 15, child: MontserratWhite('Nama', 15.0)),
                  Container(
                    width: width / 5,
                    height: 45,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      controller: _name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name cannot be null';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Row(
                children: [
                  Container(
                      width: width / 15, child: MontserratWhite('Judul', 15.0)),
                  Container(
                    width: width / 5,
                    height: 45,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      controller: _title,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Title cannot be null';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Row(
                children: [
                  Container(
                      width: width / 15,
                      child: MontserratWhite('Deskripsi', 15.0)),
                  Container(
                    width: width / 3,
                    height: 150,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      controller: _description,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Description cannot be null';
                        }
                        return null;
                      },
                      maxLines: 8,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Row(
                children: [
                  Container(
                    width: width / 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<BlocReport>(context).add(
                          EventReportPost(
                              reportNumber: int.parse(_reportNumber.text),
                              name: _name.text,
                              title: _title.text,
                              description: _description.text),
                        );
                      }
                    },
                    child: MontserratBoldWhite('Send', 18.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
