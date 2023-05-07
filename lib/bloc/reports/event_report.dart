import 'package:equatable/equatable.dart';

abstract class EventReport extends Equatable {
  @override
  List<Object> get props => [];
}

class EventReportInit extends EventReport {}

class EventReportPost extends EventReport {
  int? reportNumber;
  String? name;
  String? title;
  String? description;

  EventReportPost({this.reportNumber, this.name, this.title, this.description});

  @override
  List<Object> get props => [reportNumber!, name!, title!, description!];
}

class EventReportList extends EventReport {}

class EventReportDelete extends EventReport {
  int? id;

  @override
  EventReportDelete({this.id});

  @override
  List<Object> get props => [id!];
}

class EventReportGetById extends EventReport {
  int? id;

  @override
  EventReportGetById({this.id});

  @override
  List<Object> get props => [id!];
}

class EventReportUpdate extends EventReport {
  int? id;
  int? reportNumber;
  String? name;
  String? title;
  String? description;

  @override
  EventReportUpdate(
      {this.id, this.reportNumber, this.name, this.title, this.description});

  @override
  List<Object> get props => [id!, reportNumber!, name!, title!, description!];
}
