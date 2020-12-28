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
    
    var note: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetail()
    }
    
    private func setupDetail() {
        guard let note = note else {
            titleTextField.placeholder = "Title"
            bodyTextView.text = "Description"
            return
        }
        
        titleTextField.text = note.title
        bodyTextView.text = note.descriptions
    }

    @IBAction func saveNote(_ sender: UIBarButtonItem) {
        let formater = DateFormatter()
        formater.dateStyle = .short
        
        let newNote = Note(
            id: note?.id,
            title: titleTextField.text!,
            descriptions: bodyTextView.text,
            date: formater.string(from: Date()),
            completed: false
        )
        
        //APIService.F.addNote(note: note)
        APIService.F.updateNote(id: newNote.id!, note: newNote)
        navigationController?.popViewController(animated: true)
    }
    
}
