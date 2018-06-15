//
//  District.swift
//  RegisterLoadFromPlist
//
//  Created by tham gia huy on 6/15/18.
//  Copyright © 2018 tham gia huy. All rights reserved.
//

import Foundation

class District {
    var CityCode: Int
    var DistrictCode: Int
    var Name: String
    
    init?(dictionary: DICT) {
        guard let CityCode = dictionary["CityCode"] as? Int else { return nil }
        guard let DistrictCode = dictionary["DistrictCode"] as? Int else { return nil }
        guard let Name = dictionary["Name"] as? String else { return nil }
        
        self.CityCode = CityCode
        self.DistrictCode = DistrictCode
        self.Name = Name
    }
    
}
