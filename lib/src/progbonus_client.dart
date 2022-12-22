import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:fluent_result/fluent_result.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

import 'models/models.dart';

abstract class AuthType {}

class JwtAuthType extends AuthType {
  final String Function() getAccessToken;
  JwtAuthType(this.getAccessToken);
}

class SecretAuthType extends AuthType {
  final String secret;
  final String Function()? ts;
  SecretAuthType({required this.secret, this.ts});
}

abstract class IProgBonusClient {
  Future<ResultOf<ProgBonusCustomer?>> getCustomer();
  Future<ResultOf<ProgBonusBonus?>> getBonuses();
}

class ProgBonusClient implements IProgBonusClient {
  ProgBonusClient({
    required this.baseUrl,
    required this.tenantId,
    required this.authType,
  });

  final AuthType authType;
  final String baseUrl;
  final String tenantId;

  final client = RetryClient(http.Client());

  static const _ts = 'prog_bonus';

  /// Get my customer info
  @override
  Future<ResultOf<ProgBonusCustomer?>> getCustomer() async {
    return ResultOf.tryAsync(() async {
      final res = await _get('api/v1/customer');
      _logResponse(res);
      return successWith(
        ProgBonusCustomer.fromJson(
            jsonDecode(res.body) as Map<String, dynamic>),
      );
    });
  }

  @override
  Future<ResultOf<ProgBonusBonus?>> getBonuses() async {
    return ResultOf.tryAsync(() async {
      final res = await _get('api/v1/bonuses');
      _logResponse(res);
      return successWith(
        ProgBonusBonus.fromJson(jsonDecode(res.body) as Map<String, dynamic>),
      );
    });
  }

  Future _get(String url) async {
    final urlString = '$baseUrl/$url';
    final headers = _baseHeader();
    _logRequest('GET: $urlString', headers);
    return client.get(Uri.parse(urlString), headers: headers);
  }

  Map<String, String> _baseHeader() {
    if (authType is JwtAuthType) {
      return {
        'Authorization': 'Bearer ${(authType as JwtAuthType).getAccessToken()}',
      };
    }

    if (authType is SecretAuthType) {
      final mode = (authType as SecretAuthType);
      final currentTs = mode.ts?.call() ?? _ts;
      return {
        'tenant': tenantId,
        'secret': _computeSecret(currentTs, mode.secret),
        'ts': currentTs,
      };
    }

    throw 'Unknown auth type';
  }

  static String _computeSecret(String ts, String secret) {
    final bytes = utf8.encode('$ts$secret'); // data being hashed
    final digest = sha256.convert(bytes);
    final str = digest.toString();
    return str;
  }

  static void _logRequest(String url, Map<String, dynamic> headers) {
    log('Request url: $url');
    log('Request header: $headers');
    // log('Request body: ${res.body}');
  }

  static void _logResponse(dynamic res) {
    log('Response status: ${res.statusCode}');
    log('Response body: ${res.body}');
  }
}
