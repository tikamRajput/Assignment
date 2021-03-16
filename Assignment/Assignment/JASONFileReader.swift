//
//  JASONFileReader.swift
//  Assignment
//
//  Created by AK on 15/03/21.
//

import Foundation

protocol JSONFileDelegates {
    func returnJSON(_ jsondata: [DataModel])
    func returnError(_ errorMessage: String)
}

class JASONFileReader {
    
    var delegates: JSONFileDelegates?
    
    private func readDataFromFile(_ fileName: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: fileName, ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            delegates?.returnError(error.localizedDescription)
        }
        return nil
    }
    
    private func parseData(_ data: Data) {
        do {
            let decodedData = try JSONDecoder().decode([DataModel].self,from: data)
            delegates?.returnJSON(decodedData)
        } catch {
            delegates?.returnError(error.localizedDescription)
        }
    }
    
    
    func getJsonData(fileReader name: String) {
        if let jsonData = readDataFromFile(name) {
            parseData(jsonData)
        }
    }
    
}
