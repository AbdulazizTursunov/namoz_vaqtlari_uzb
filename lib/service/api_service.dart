import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:namoz_vaqtlari_uzb/model/week/week_model.dart';
import 'package:namoz_vaqtlari_uzb/utils/constant/constant.dart';
import '../model/day/day_model.dart';
import '../model/month/month_model.dart';

class ApiService {
  ApiService() {
    _init();
  }

  final Dio _dio = Dio();

  void _init() => _dio.interceptors.addAll([
        LogInterceptor(
            responseBody: kDebugMode,
            requestBody: kDebugMode,
            logPrint: (object) =>
                kDebugMode ? log('Dio Log: ${object.toString()}') : null),
      ]);

  // kunlik malumotlarni olib keladi
  Future<DailyPrayerTimes> getDailyPrayerTimes(String region) async {
    try {
      final Response response = await _dio.get('$kunlikBaseUrl$region');
      if (kDebugMode) {
        print(response.data);
      }
      if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
        return DailyPrayerTimes.fromJson(response.data);
      }
      throw UnknownException();
    } on DioException catch (e) {
      throw DioFailure(
        massage: e.message,
        statusCode: e.response?.statusCode ?? 0,
      );
    }
  }

  // haftalik malumotlarni olib keladi
  Future<List<Haftaliknamozvaqtlari>> getHaftalikNamozVaqtlari(
      String region) async {
    try {
      final Response response = await _dio.get('$haftalikBaseUrl$region');
      if (kDebugMode) {
        print(response.data);
        if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
          return [
            for (final e in response.data as List)
              Haftaliknamozvaqtlari.fromJson(e)
          ];
        }
      }
      throw UnknownException();
    } on DioException catch (e) {
      throw DioFailure(
        massage: e.message,
        statusCode: e.response!.statusCode ?? 0,
      );
    }
  }

  // oylik malumotlarni olib keladi
  Future<List<OyliknamozVaqtlari>> getOyliknamozVaqtlari(
      int number) async {
    try {
      final Response response = await _dio.get('$oylikBaseUrl$number');
      if (kDebugMode) {
        print(response.data);
      }
      if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
        return [
          for (final e in response.data as List)
            OyliknamozVaqtlari.fromJson(e)
        ];
      }
      throw UnknownException();
    } on DioException catch (e) {
      throw DioFailure(
        massage: e.message,
        statusCode: e.response!.statusCode ?? 0,
      );
    }
  }
}

class UnknownException implements Exception {}

class DioFailure implements Exception {
  DioFailure({this.statusCode, this.massage});

  final int? statusCode;
  final String? massage;
}
