//
//  District.swift
//  RegisterLoadFromPlist
//
//  Created by tham gia huy on 6/15/18.
//  Copyright © 2018 tham gia huy. All rights reserved.
//

import Foundation

class District {
    var cityCode: Int
    var districtCode: Int
    var name: String
    
    init?(dictionary: DICT) {
        guard let cityCode = dictionary["CityCode"] as? Int else { return nil }
        guard let districtCode = dictionary["DistrictCode"] as? Int else { return nil }
        guard let name = dictionary["Name"] as? String else { return nil }
        
        self.cityCode = cityCode
        self.districtCode = districtCode
        self.name = name
    }
    
}
