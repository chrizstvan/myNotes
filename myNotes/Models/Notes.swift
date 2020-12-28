//
//  Notes.swift
//  myNotes
//
//  Created by Chris Stev on 28/12/20.
//

import Foundation

struct Note: Decodable {
    let id: Int
    let title: String
    let descriptions: String
    let date: String
    let completed: Bool
}
