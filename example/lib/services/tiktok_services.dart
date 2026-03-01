import 'package:flutter/foundation.dart';
import 'package:tiktok_events_sdk/tiktok_events_sdk.dart';

class TikTokService {
  static Future<void> init({
    String? androidAppId,
    required String tikTokAndroidId,
    String? iosAppId,
    required String tiktokIosId,
    bool isDebugMode = false,
    required String accessToken,
    TikTokLogLevel logLevel = TikTokLogLevel.info,
  }) async {
    debugPrint('🔵 TikTokService.init called');
    debugPrint(
        '🔵 Android App ID: ${androidAppId?.isEmpty ?? true ? "EMPTY" : "PROVIDED"}');
    debugPrint(
        '🔵 iOS App ID: ${iosAppId?.isEmpty ?? true ? "EMPTY" : "PROVIDED"}');
    debugPrint('🔵 Access Token: PROVIDED');

    debugPrint('🔵 Calling TikTokEventsSdk.initSdk...');
    await TikTokEventsSdk.initSdk(
      accessToken: accessToken,
      androidAppId: androidAppId,
      tikTokAndroidId: tikTokAndroidId,
      iosAppId: iosAppId,
      tiktokIosId: tiktokIosId,
      isDebugMode: isDebugMode,
      logLevel: logLevel,
    );
    debugPrint('✅ TikTokEventsSdk.initSdk completed');
  }

  static Future<void> startTrack() async {
    await TikTokEventsSdk.startTrack();
  }

  static Future<void> identify({
    String? externalId,
    String? externalUserName,
    String? phoneNumber,
    String? email,
  }) async {
    if (externalId == null || externalUserName == null || email == null) {
      throw Exception('externalId, externalUserName, and email are required');
    }

    final identifier = TikTokIdentifier(
      externalId: externalId,
      externalUserName: externalUserName,
      phoneNumber: phoneNumber,
      email: email,
    );
    await TikTokEventsSdk.identify(
      identifier: identifier,
    );
  }

  static Future<void> logout() async {
    await TikTokEventsSdk.logout();
  }

  static Future<void> logEvent({
    required String eventName,
    TTEventType? eventType,
    String? eventId,
    EventProperties? properties,
  }) async {
    await TikTokEventsSdk.logEvent(
      event: TikTokEvent(
        eventName: eventName,
        eventType: eventType ?? TTEventType.none,
        eventId: eventId,
        properties: properties,
      ),
    );
  }
}
