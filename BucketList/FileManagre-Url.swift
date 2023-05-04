//
//  FileManagre-Url.swift
//  BucketList
//
//  Created by Matheus Viana on 13/04/23.
//

import Foundation

extension FileManager {
    static var DocumentDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)        
        return paths[0]
    }
}
