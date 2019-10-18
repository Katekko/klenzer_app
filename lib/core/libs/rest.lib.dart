import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:klenzer_app/config.dart';
import 'package:klenzer_app/core/blocs/loading.bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RestLib {
  final JsonDecoder _decoder = JsonDecoder();
  final ConfigEnvironments _config = ConfigEnvironments();

  Future<dynamic> get({
    @required String url,
    mimeType = 'json',
  }) async {
    try {
      LoadingBloc.updateLoading(true);
      final ambiente = _config.getEnvironments();
      final http.Response response = await http.get(
        ambiente['url'] + url,
        headers: await _getHeaders(mimeType),
      );

      if (_isSuccessRequest(response.statusCode)) {
        final output = _decoder.convert(response.body);
        return output;
      } else {
        throw Exception('Falha ao obter dados');
      }
    } catch (e) {
      throw Exception(e);
    } finally {
      LoadingBloc.updateLoading(false);
    }
  }

  Future<dynamic> post({
    @required String url,
    body,
    mimeType = 'json',
  }) async {
    try {
      LoadingBloc.updateLoading(true);
      final ambiente = _config.getEnvironments();
      final finalUrl = ambiente['url'] + url;
      final http.Response response = await http.post(
        finalUrl,
        body: json.encode(body),
        headers: await _getHeaders(mimeType),
        encoding: Encoding.getByName('utf-8'),
      );

      if (_isSuccessRequest(response.statusCode)) {
        final output = _decoder.convert(response.body);
        return output;
      } else if (response.statusCode == 400) {
        final output = _decoder.convert(response.body);
        throw output['message'];
      } else {
        throw response.reasonPhrase;
      }
    } catch (e) {
      rethrow;
    } finally {
      LoadingBloc.updateLoading(false);
    }
  }

  bool _isSuccessRequest(int httpCode) {
    return httpCode >= 200 && httpCode < 300;
  }

  Future<Map<String, String>> _getHeaders(String mimetype) async {
    final _prefs = await SharedPreferences.getInstance();

    Map<String, String> headers = Map<String, String>();
    headers.addAll({
      'accept': 'application/' + mimetype,
      'content-type': 'application/json'
    });

    if (_prefs.containsKey('token')) {
      headers.addAll({'Authorization': 'bearer ' + _prefs.getString('token')});
    }

    return Future.value(headers);
  }
}
