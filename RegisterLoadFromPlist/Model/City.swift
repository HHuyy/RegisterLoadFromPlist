//
//  Cities.swift
//  RegisterLoadFromPlist
//
//  Created by tham gia huy on 6/15/18.
//  Copyright © 2018 tham gia huy. All rights reserved.
//

import Foundation

class City {
    
    var cityCode: Int
    var name: String
    
    init?(dictionary: DICT) {
        guard let name = dictionary["Name"] as? String else { return nil }
        guard let cityCode = dictionary["CityCode"] as? Int else { return nil }
        
        self.cityCode = cityCode
        self.name = name
    }
}
