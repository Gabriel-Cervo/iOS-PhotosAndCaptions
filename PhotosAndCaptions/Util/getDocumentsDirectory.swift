//
//  getDocumentsDirectory.swift
//  PhotosAndCaptions
//
//  Created by Joao Gabriel Dourado Cervo on 28/02/21.
//

import Foundation

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    
    return paths[0]
}
