//
//  FileManagre-Url.swift
//  BucketList
//
//  Created by Matheus Viana on 13/04/23.
//

import Foundation

extension FileManager {
    func GetFileManagerUrl() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
}
