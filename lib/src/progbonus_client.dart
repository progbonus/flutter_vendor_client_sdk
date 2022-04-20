import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:fluent_result/fluent_result.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

import 'models/models.dart';

abstract class IProgBonusClient {
  Future<ResultOf<ProgBonusCustomer?>> getCustomer();
  Future<ResultOf<ProgBonusBonus?>> getBonuses();
}

class ProgBonusClient implements IProgBonusClient {
  ProgBonusClient({
    required this.baseUrl,
    required this.getAccessToken,
    required this.tenantsId,
    required this.secret,
  });

  final String baseUrl;
  final String Function() getAccessToken;
  final String tenantsId;
  final String secret;
  final client = RetryClient(http.Client());

  static const _ts = 'shop';

  /// Get my customer info
  @override
  Future<ResultOf<ProgBonusCustomer?>> getCustomer() async {
    try {
      //
      final res = await _get('api/v1/customer');
      _logResponse(res);
      return ResultOf.success(
        ProgBonusCustomer.fromJson(
            jsonDecode(res.body) as Map<String, dynamic>),
      );
    } catch (e) {
      return ResultOf.withException(e as Exception);
    }
  }

  @override
  Future<ResultOf<ProgBonusBonus?>> getBonuses() async {
    try {
      //
      final res = await _get('api/v1/bonuses');
      _logResponse(res);
      return ResultOf.success(
        ProgBonusBonus.fromJson(jsonDecode(res.body) as Map<String, dynamic>),
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
      'tenant': '20DA8AB6-B8DB-44C5-43F9-08D58DED04A5',
      'secret': _computeSecret(_ts, secret),
      'ts': _ts,
    };
  }

  static String _computeSecret(String ts, String secret) {
    // '71F5AC1754B69E3E42815AB3BBE8F94F43CA8A0BB7C2B86C7E8CCB688158DC92', // shopdimanche

    final bytes = utf8.encode('$ts$secret'); // data being hashed
    final digest = sha256.convert(bytes);
    final str = digest.toString();
    return str;
  }

  static void _logResponse(dynamic res) {
    log('Response status: ${res.statusCode}');
    log('Response body: ${res.body}');
  }
}
