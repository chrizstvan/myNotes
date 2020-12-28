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
    let BASE_URL = ""
    
    func getNotes() {
        AF.request(BASE_URL + "/notes", method: .get).response { [weak self] response in
            
            let data = String(data: response.data!, encoding: .utf8)
            self?.delegate?.updateData(newData: data!)
        }
    }
    
    func addNote(note: Note) {
        let param: [String: Any] = [
            "title": note.title,
            "descriptions": note.descriptions,
            "date": note.date,
            "completed": note.completed
        ]
        
        AF.request(
            BASE_URL + "/notes",
            method: .post,
            parameters: param,
            encoding: JSONEncoding.default
        ).responseJSON { response in
            // response logic
        }
    }
    
    func updateNote(id: Int, note: Note) {
        let param: [String: Any] = [
            "title": note.title,
            "descriptions": note.descriptions,
            "date": note.date,
            "completed": note.completed
        ]
        
        AF.request(
            BASE_URL + "/notes/\(id)",
            method: .put,
            parameters: param,
            encoding: JSONEncoding.default
        ).responseJSON { response in
            // response logic
        }
    }
}
