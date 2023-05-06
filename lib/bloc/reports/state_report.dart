import 'package:aggregator/model/reports/report_list_model.dart';
import 'package:equatable/equatable.dart';

abstract class StateReport extends Equatable {
  List<Object> get props => [];
}

class StateReportInit extends StateReport {}

class StateReportLoading extends StateReport {}

class StateReportPostResponse extends StateReport {
  bool? status;
  String? message;
  int? code;
  ReportListModel? reportListModel;

  StateReportPostResponse(
      {this.status, this.message, this.code, this.reportListModel});

  List<Object> get props => [status!, message!, code!, reportListModel!];
}

class StateReportListResponse extends StateReport {
  ReportListModel? reportListModel;

  @override
  StateReportListResponse({this.reportListModel});

  @override
  List<Object> get props => [reportListModel!];
}
