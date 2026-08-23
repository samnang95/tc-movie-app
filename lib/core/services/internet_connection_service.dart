import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../router/app_router.dart';

/// Service to monitor internet connectivity and latency (Slow / Good / Offline).
class InternetConnectionService {
  static final InternetConnectionService _instance =
      InternetConnectionService._internal();
  factory InternetConnectionService() => _instance;
  InternetConnectionService._internal();

  bool _isOnline = true;
  bool _isSlow = false;
  bool _initialized = false;

  bool _wasOnline = true;
  bool _wasSlow = false;

  Timer? _pollingTimer;

  bool get isOnline => _isOnline;
  bool get isSlow => _isSlow;

  void init() {
    if (_initialized || kIsWeb) return;
    _initialized = true;

    // Initial check after app starts
    Future.delayed(const Duration(seconds: 1), checkConnection);

    // Periodically check every 10 seconds
    _pollingTimer = Timer.periodic(const Duration(seconds: 10), (_) {
      checkConnection();
    });
  }

  Future<void> checkConnection() async {
    if (kIsWeb) return;

    try {
      final stopwatch = Stopwatch()..start();

      // Ping Google DNS directly to bypass cache and measure real network latency
      final socket = await Socket.connect(
        '8.8.8.8',
        53,
        timeout: const Duration(seconds: 4),
      );
      socket.destroy();
      stopwatch.stop();

      final latency = stopwatch.elapsedMilliseconds;

      // If it takes longer than 1.5 seconds, connection is slow
      if (latency > 1500) {
        _updateStatus(online: true, slow: true);
      } else {
        _updateStatus(online: true, slow: false);
      }
    } catch (_) {
      // Socket connection failed or timed out -> No internet
      _updateStatus(online: false, slow: false);
    }
  }

  void _updateStatus({required bool online, required bool slow}) {
    _isOnline = online;
    _isSlow = slow;

    // Do not show duplicate alerts if the status hasn't changed
    if (_wasOnline == online && _wasSlow == slow) return;

    _wasOnline = online;
    _wasSlow = slow;

    _showSnackbar(online: online, slow: slow);
  }

  void _showSnackbar({required bool online, required bool slow}) {
    final messenger = rootScaffoldMessengerKey.currentState;
    if (messenger == null) return;

    final String title;
    final String message;
    final Color bgColor;
    final IconData icon;

    if (!online) {
      title = "No Internet";
      message = "Please check your connection";
      bgColor = const Color(0xFFD32F2F); // Red
      icon = Icons.wifi_off_rounded;
    } else if (slow) {
      title = "Poor Connection";
      message = "Internet is slow or unstable";
      bgColor = const Color(0xFFF57C00); // Orange
      icon = Icons.network_check_rounded;
    } else {
      title = "Connected";
      message = "Internet is working fine";
      bgColor = const Color(0xFF2E7D32); // Green
      icon = Icons.wifi_rounded;
    }

    messenger.removeCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        duration: const Duration(seconds: 4),
        backgroundColor: bgColor.withValues(alpha: 0.95),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        content: Row(
          children: [
            Icon(icon, color: Colors.white, size: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    message,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void dispose() {
    _pollingTimer?.cancel();
  }
}
