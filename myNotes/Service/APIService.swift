//
//  APIService.swift
//  myNotes
//
//  Created by Chris Stev on 28/12/20.
//

import Foundation
import  Alamofire

protocol DataDelegate {
    func updateData(newData: String)
}

class APIService {
    static let F = APIService()
    var delegate: DataDelegate?
    
    func getNotes() {
        AF.request("").response { [weak self] response in
            print(response.data as Any)
            
            let data = String(data: response.data!, encoding: .utf8)
            self?.delegate?.updateData(newData: data!)
        }
    }
}
