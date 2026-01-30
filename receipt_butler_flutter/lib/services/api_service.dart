import 'dart:io' as io;
import 'package:flutter/foundation.dart';
import 'package:receipt_butler_client/receipt_butler_client.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();

  Client? _client;

  void init() {
    // REAL DEVICE CONFIG (Wi-Fi):
    // Use your laptop's Local IP Address from ipconfig (Wireless LAN adapter Wi-Fi)
    const String serverIp = '192.168.1.3';
    // const String host = 'http://$serverIp:8080/';
    String host = 'https://receipt-sorter.api.serverpod.space/';

    // String host;
    if (kDebugMode) {
      // Use local host for development
      host = 'http://$serverIp:8080/';
      // OR use your serverIp logic if testing on a real phone
    } else {
      // Use production host for live app
      host = 'https://receipt-sorter.api.serverpod.space/';
    }

    debugPrint('API Client initialized with host: $host');

    _client =
        Client(
            host,
            authenticationKeyManager: FlutterAuthenticationKeyManager(),
            connectionTimeout: const Duration(minutes: 5),
          )
          ..connectivityMonitor = FlutterConnectivityMonitor()
          ..authSessionManager = FlutterAuthSessionManager();

    _client!.auth.initialize();
  }

  Client get client {
    if (_client == null) {
      init();
    }
    return _client!;
  }
}
