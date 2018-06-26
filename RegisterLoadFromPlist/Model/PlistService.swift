//
//  PlistService.swift
//  RegisterLoadFromPlist
//
//  Created by tham gia huy on 6/15/18.
//  Copyright © 2018 tham gia huy. All rights reserved.
//

import Foundation

class PlistService {
    
    func getDataFromPlist(plist: String) -> DICT? {
        var results: DICT?
        let fileNameComponents = plist.components(separatedBy: ".")
        guard let filePath = Bundle.main.path(forResource: fileNameComponents.first ?? "", ofType: fileNameComponents.last ?? "") else { return nil }
        guard FileManager.default.fileExists(atPath: filePath) else { return nil }
        guard let data = FileManager.default.contents(atPath: filePath) else { return nil }
        do {
            guard let root = try PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as? DICT else { return nil }
            results = root
        } catch {
            print("PropertyListSerialization Error")
        }
        return results
    }
}
