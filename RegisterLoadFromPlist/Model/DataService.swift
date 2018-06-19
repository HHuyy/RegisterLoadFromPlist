//
//  DataService.swift
//  RegisterLoadFromPlist
//
//  Created by tham gia huy on 6/15/18.
//  Copyright © 2018 tham gia huy. All rights reserved.
//

import Foundation

typealias DICT = Dictionary<AnyHashable, Any>

class DataService {
    
    static let shared: DataService = DataService()
    private var _cities:[City]?
    var cities: [City] {
        get {
            if _cities == nil {
                getDataCities()
            }
            return _cities ?? []
        }
        set {
            _cities = newValue
        }
    }
    func getDataCities() {
        _cities = []
        guard let dictionary = PlistService().getDataFromPlist(plist: "Cities.plist") else { return  }
        guard let cityDictionary = dictionary["Cities"] as? [DICT] else { return  }
        for dataCity in cityDictionary {
            if let city = City(dictionary: dataCity) {
                _cities?.append(city)
            }
        }
    }
    
    private var _districts: [District]?
    var districts: [District] {
        get {
            if _districts == nil {
                getDataDistricts()
            }
            return _districts ?? []
        }
        set {
            _districts = newValue
        }
    }
    
    func getDataDistricts() {
        _districts = []
        guard let dictionary = PlistService().getDataFromPlist(plist: "Districts.plist") else { return  }
        guard let districtDictionary = dictionary["Districts"] as? [DICT] else { return  }
        for districtObject in districtDictionary {
            if let district = District(dictionary: districtObject) {
                _districts?.append(district)
            }
        }
    }
    
    func fillterDistrict(with cityCode: Int) -> [District] {
        
//        var fillterDistrict: [District] = []
//        
//        for district in _districts ?? [] {
//            if district.cityCode == cityCode {
//                fillterDistrict.append(district)
//            }
//        }
        
        return _districts?.filter { $0.cityCode == cityCode } ?? []
    }
}
