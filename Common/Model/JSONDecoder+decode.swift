//
//  JSONDecoder+decode.swift
//  ionicup
//
//  Created by Lorenzo Fiamingo on 15/12/2019.
//  Copyright © 2019 Lorenzo Fiamingo. All rights reserved.
//

import Foundation

extension JSONDecoder {
    
    func decode<T>(_ type: T.Type, from object: Any) throws -> T where T: Decodable {
        return try decode(T.self, from: try JSONSerialization.data(withJSONObject: object, options: []))
    }
}
