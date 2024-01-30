import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

enum MethodHTTP { get, post, put, patch }

extension MethodHTTPEx on MethodHTTP {
  String get methodName {
    return name.toUpperCase();
  }
}

enum ContentType { none, json, multipart }

mixin BaseApi {
  Future<T> request<T>(
    String url,
    T Function(Map<String, dynamic> json) fromJson, {
    MethodHTTP method = MethodHTTP.post,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    bool showLog = false,
    ContentType contentType = ContentType.none,
    FormData? formData,
  }) async {
    var mapHeader = <String, dynamic>{};

    if (contentType == ContentType.json) {
      mapHeader['Content-Type'] = 'application/json';
    } else if (contentType == ContentType.multipart) {
      mapHeader['Content-Type'] = 'multipart/form-data';
    }

    if (headers != null) {
      mapHeader.addAll(headers);
    }

    var requestOptions = RequestOptions();
    requestOptions.path = url;
    requestOptions.headers = mapHeader;
    requestOptions.validateStatus = (status) {
      if (status != null) {
        return status >= 200 && status <= 299;
      }
      return false;
    };
    requestOptions.sendTimeout = const Duration(seconds: 20);
    requestOptions.receiveTimeout = const Duration(seconds: 20);
    requestOptions.method = method.methodName;
    if (body != null) {
      requestOptions.data = json.encode(body);
    }
    if (formData != null) {
      requestOptions.data = formData;
    }
    requestOptions.queryParameters = queryParameters ?? {};

    developer.log(mapHeader.toString(), name: 'header');
    final dio = Dio();
    final response = await dio.fetch(requestOptions);
    if (showLog) {
      debugPrint(response.realUri.toString());
      if (body != null) {
        debugPrint(json.encode(body.removeNull));
      }
      developer.log(json.encode(response.data), name: method.methodName);
    }
    var data = fromJson(json.decode(response.data));
    return data;
  }
}

extension JsonExtension on Map<String, dynamic> {
  Map<String, dynamic> get removeNull {
    removeWhere((String key, dynamic value) => value == null);
    return this;
  }
}
