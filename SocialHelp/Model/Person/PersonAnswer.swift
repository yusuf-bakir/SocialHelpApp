//
//  PersonAnswer.swift
//  SocialHelp
//
//  Created by yusuf bakır on 19.12.2023.
//

import Foundation
struct PersonAnswer :Codable{
    let success: Bool
        let message: String
        
    }

    // MARK: - Encode/decode helpers

//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
//




//{
//    data =     {
//        birthOfDateYear = 5645;
//        email = fdsfdfd;
//        id = 70;
//        identityNumber = 0;
//        job = dsfsdf;
//        name = fdsfd;
//        password = 11111111111;
//        phone = 11111111111;
//        surname = fdsfds;
//    };
//    message = eklendi;
//    success = 1;
//}
