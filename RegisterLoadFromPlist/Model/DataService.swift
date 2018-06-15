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
        guard let filePath = Bundle.main.path(forResource: "Cities", ofType: "plist") else { return  }
        guard let data = FileManager.default.contents(atPath: filePath) else { return }
        do {
            guard let results = try PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as? DICT else { return  }
            if let dataCities = results["Cities"] as? [DICT] {
                for cityObject in dataCities {
                    if let city = City(dictionary: cityObject) {
                        _cities?.append(city)
                    }
                }
            }
        } catch {
            print("PropertyListSerialization Error")
        }
    }
    
    private var _Districts: [District]?
    var Districts: [District] {
        get {
            if _Districts == nil {
                getDataDistricts()
            }
            return _Districts ?? []
        }
        set {
            _Districts = newValue
        }
    }
    
    func getDataDistricts() {
        _Districts = []
        guard let filePath = Bundle.main.path(forResource: "Districts", ofType: "plist") else { return }
        guard let data = FileManager.default.contents(atPath: filePath) else { return }
        do {
            guard let results = try PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as? DICT else { return }
            if let dataDistricts = results["Districts"] as? [DICT] {
                for DistrictObject in dataDistricts {
                    if let District = District(dictionary: DistrictObject) {
                        _Districts?.append(District)
                    }
                }
            }
        } catch {
            print("PropertyListSerialization Error")
        }
    }
}
