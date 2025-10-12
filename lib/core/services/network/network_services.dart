import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class NetworkService {
  Future<bool> isConnected();
}

class NetworkServiceImpl implements NetworkService {
  final Dio dio;

  NetworkServiceImpl({required this.dio});

  @override
  Future<bool> isConnected() async {
    try {
      // For web platform, use a simpler approach
      if (kIsWeb) {
        // On web, try a lightweight connectivity check
        try {
          final response = await dio.head(
            'https://www.google.com/favicon.ico',
            options: Options(
              receiveTimeout: const Duration(seconds: 5),
              headers: {'Cache-Control': 'no-cache'},
            ),
          );
          return response.statusCode == 200;
        } catch (e) {
          if (kDebugMode) {
            print('Web connectivity check failed: $e');
          }
          // On web, if network check fails, assume connection exists
          // Firebase will handle the actual connectivity
          return true;
        }
      }

      // For mobile platforms, use multiple URLs for better reliability
      final List<String> testUrls = [
        'https://www.google.com/',
        'https://httpbin.org/get',
        'https://jsonplaceholder.typicode.com/posts/1',
      ];

      for (final String testUrl in testUrls) {
        try {
          final response = await dio.get(
            testUrl,
            options: Options(
              sendTimeout: const Duration(seconds: 8),
              receiveTimeout: const Duration(seconds: 8),
              headers: {
                'Accept': 'application/json',
                'User-Agent': 'Flutter-App',
              },
            ),
          );

          // Check if response is successful
          if (response.statusCode != null &&
              response.statusCode! >= 200 &&
              response.statusCode! < 300) {
            return true;
          }
        } on DioException catch (e) {
          // Log the specific error for debugging
          if (kDebugMode) {
            print('Network check failed for $testUrl: ${e.message}');
          }
          // Continue to next URL if this one fails
          continue;
        } catch (e) {
          // Log the specific error for debugging
          if (kDebugMode) {
            print('Network check error for $testUrl: $e');
          }
          continue;
        }
      }

      // If all URLs failed on mobile, return false
      return false;
    } catch (e) {
      if (kDebugMode) {
        print('Network check general error: $e');
      }
      // On web, assume connection exists if check fails
      return kIsWeb;
    }
  }
}
