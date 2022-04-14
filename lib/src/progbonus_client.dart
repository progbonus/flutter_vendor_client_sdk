import 'dart:convert';
import 'dart:developer';

import 'package:fluent_result/fluent_result.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:progbonus/src/models/models.dart';

abstract class IProgBonusClient {
  Future<ResultOf<ProgBonusCustomer?>> getCustomer();
}

class ProgBonusClient implements IProgBonusClient {
  ProgBonusClient({
    required this.baseUrl,
    required this.getAccessToken,
  });

  final String baseUrl;
  final String Function() getAccessToken;
  final client = RetryClient(http.Client());

  /// Get my customer info
  Future<ResultOf<ProgBonusCustomer?>> getCustomer() async {
    try {
      //
      final res = await _get('api/v1/me');

      log('Response status: ${res.statusCode}');
      log('Response body: ${res.body}');

      return ResultOf.success(
        ProgBonusCustomer.fromJson(
            jsonDecode(res.body) as Map<String, dynamic>),
      );
    } catch (e) {
      return ResultOf.withException(e as Exception);
    }
  }

  Future _get(String url) async {
    return client.get(
      Uri.parse('$baseUrl/$url'),
      headers: _baseHeader(),
    );
  }

  Map<String, String> _baseHeader() {
    return {
      'Authorization': 'Bearer ${getAccessToken()}',
    };
  }
}
