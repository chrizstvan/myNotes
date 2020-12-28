//
//  DetailViewController.swift
//  myNotes
//
//  Created by Chris Stev on 28/12/20.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func saveNote(_ sender: UIBarButtonItem) {
        let formater = DateFormatter()
        formater.dateStyle = .short
        
        let note = Note(
            id: nil,
            title: titleTextField.text!,
            descriptions: bodyTextView.text,
            date: formater.string(from: Date()),
            completed: false
        )
        
        APIService.F.addNote(note: note)
        navigationController?.popViewController(animated: true)
    }
    
}
