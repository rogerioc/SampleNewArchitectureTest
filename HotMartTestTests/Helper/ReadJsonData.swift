//
//  ReadJsonData.swift
//  HotMartTestTests
//
//  Created by rogerio on 11/07/20.
//  Copyright © 2020 rogerio. All rights reserved.
//

import Foundation

class ReadJsonData<T: Decodable> {
    
    func getJson<T: Decodable>(fileName: String) -> T? {
        
        if let url = Bundle(for: type(of: self)).url(forResource: fileName, withExtension: "json") {
            do {
                let decoder = JSONDecoder()
                let data = try Data(contentsOf: url)
                let result = try decoder.decode(T.self, from: data)
                return result
            } catch {
                print(error)
                print("Error!! Unable to parse  \(fileName).json")
            }
        }
        return nil
    }
    
}
