
import Foundation

struct ConnectWithChargerCodeResponseModel: Codable {
    let success: Bool?
    let code: Int?
    let data: ChargerResponse?
    let message: String?
}

struct ChargerResponse: Codable {
    let response : String?
}


