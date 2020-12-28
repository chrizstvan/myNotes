//
//  Notes.swift
//  myNotes
//
//  Created by Chris Stev on 28/12/20.
//

import Foundation

struct Note: Codable {
    let id: Int?
    let title: String
    let descriptions: String
    let date: String
    let completed: Bool
}

struct NoteReq: Codable {
    let title: String
    let descriptions: String
    let date: String
    let completed: Bool
}
