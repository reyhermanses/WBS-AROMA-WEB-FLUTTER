import 'dart:convert';

import 'package:aggregator/bloc/reports/event_report.dart';
import 'package:aggregator/bloc/reports/state_report.dart';
import 'package:aggregator/model/reports/report_get_by_id_model.dart';
import 'package:aggregator/model/reports/report_list_model.dart';
import 'package:aggregator/model/reports/report_model.dart';
import 'package:aggregator/repository/repository_auth.dart';
import 'package:aggregator/repository/repository_report.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocReport extends Bloc<EventReport, StateReport> {
  BlocReport() : super(StateReportInit()) {
    RepositoryReport _repositoryReport = new RepositoryReport();
    RepositoryAuth _repositoryAuth = new RepositoryAuth();
    on<EventReportPost>((event, emit) async {
      emit(StateReportLoading());
      var token = await _repositoryAuth.read_token();
      var responseReport = await _repositoryReport.post(
        event.reportNumber,
        event.name,
        event.title,
        event.description,
        token,
      );
      var responseList = await _repositoryReport.list(token);

      ReportModel _rm = ReportModel.fromJson(jsonDecode(responseReport.body));
      ReportListModel _rlm =
          ReportListModel.fromJson(jsonDecode(responseList.body));

      if (responseReport.statusCode == 201) {
        emit(StateReportPostResponse(
            status: _rm.status,
            message: _rm.message,
            code: _rm.code,
            reportListModel: _rlm));
      } else {
        emit(StateReportPostResponse(
            status: _rm.status, message: _rm.message, code: _rm.code));
      }
    });

    on<EventReportList>((event, emit) async {
      emit(StateReportLoading());

      var token = await _repositoryAuth.read_token();

      var response = await _repositoryReport.list(token);

      if (response.statusCode == 200) {
        ReportListModel _rlm =
            ReportListModel.fromJson(jsonDecode(response.body));
        emit(StateReportPostResponse(
            reportListModel: _rlm, message: _rlm.message));
      } else if (response.statusCode == 401) {
        emit(StateReportPostResponse(
            status: false, message: 'Go Find Your Credential', code: 401));
      } else if (response.statusCode == 408) {
        emit(StateReportPostResponse(
            status: false,
            message: 'Check your network connection',
            code: response.statusCode));
      } else
        emit(StateReportPostResponse(
            status: false, message: 'Unknown', code: 404));
    });

    on<EventReportDelete>((event, emit) async {
      emit(StateReportLoading());

      var token = await _repositoryAuth.read_token();
      var response = await _repositoryReport.delete(event.id!, token);
      var responseList = await _repositoryReport.list(token);

      try {
        if (response.statusCode == 201) {
          ReportModel _rm = ReportModel.fromJson(jsonDecode(response.body));
          ReportListModel _rlm =
              ReportListModel.fromJson(jsonDecode(responseList.body));
          emit(StateReportPostResponse(
              status: _rm.status,
              message: _rm.message,
              code: response.statusCode,
              reportListModel: _rlm));
        } else if (response.statusCode == 401) {
          emit(StateReportPostResponse(
              status: false, message: 'Go Find Your Credential', code: 401));
        } else if (response.statusCode == 408) {
          emit(StateReportPostResponse(
              status: false,
              message: 'Check your network connection',
              code: 400));
        } else
          emit(StateReportPostResponse(
              status: false, message: 'Unknown', code: 404));
      } catch (e) {
        emit(StateReportPostResponse(
            status: false, message: e.toString(), code: 500));
      }
    });

    on<EventReportGetById>(
      (event, emit) async {
        emit(StateReportLoading());
        var token = await _repositoryAuth.read_token();
        var response = await _repositoryReport.get_by_id(event.id, token);

        try {
          if (response.statusCode == 200) {
            ReportGetByIdModel _rgbim =
                ReportGetByIdModel.fromJson(jsonDecode(response.body));
            emit(StateReportPostResponse(
                status: _rgbim.status,
                message: _rgbim.message,
                code: response.statusCode,
                rgbim: _rgbim));
          } else if (response.statusCode == 401) {
            emit(StateReportPostResponse(
                status: false, message: 'Go find your credential!', code: 404));
          } else if (response.statusCode == 408) {
            emit(StateReportPostResponse(
                status: false,
                message: 'Check your network connection',
                code: 400));
          } else
            emit(StateReportPostResponse(
                status: false, message: 'Unknown', code: 404));
        } catch (e) {
          emit(StateReportPostResponse(
              status: false, message: 'Unknown', code: 404));
        }
      },
    );

    on<EventReportUpdate>(
      (event, emit) async {
        emit(StateReportLoading());

        var token = await _repositoryAuth.read_token();
        var response = await _repositoryReport.update(
            event.id!,
            event.reportNumber!,
            event.name!,
            event.title!,
            event.description!,
            token);
        var responseUpdate =
            await _repositoryReport.get_by_id(event.id!, token);

        if (response.statusCode == 200) {
          ReportModel _rm = ReportModel.fromJson(jsonDecode(response.body));
          ReportGetByIdModel _rgbim =
              ReportGetByIdModel.fromJson(jsonDecode(responseUpdate.body));
          emit(StateReportPostResponse(
              status: _rm.status,
              message: _rm.message,
              code: response.statusCode,
              rgbim: _rgbim));
        } else if (response.statusCode == 408) {
          emit(StateReportPostResponse(
              status: false,
              message: 'Check your network connection',
              code: response.statusCode));
        } else
          emit(StateReportPostResponse(
              status: false, message: 'Unknown', code: 404));
      },
    );
  }
}
