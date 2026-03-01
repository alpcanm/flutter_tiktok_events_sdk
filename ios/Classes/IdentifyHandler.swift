import Flutter
import Foundation
import TikTokBusinessSDK

struct IdentifyHandler {

    static func handle(call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let args = call.arguments as? [String: Any] else {
            result(
                FlutterError(
                    code: "INVALID_ARGUMENTS", message: "Invalid arguments", details: nil))
            return
        }

        let externalId = args["externalId"] as? String
        let externalUserName = args["externalUserName"] as? String
        let phoneNumber = args["phoneNumber"] as? String
        let email = args["email"] as? String


        TikTokBusiness.identify(
            withExternalID: externalId,
            externalUserName: externalUserName,
            phoneNumber: phoneNumber,
            email: email
        )

        result("User identified successfully!")
    }
}
