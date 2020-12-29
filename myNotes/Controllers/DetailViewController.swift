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
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    
    var note: Note?
    
    var requiredFieldNotEmpty: Bool {
        !titleTextField.text!.isEmpty
            && !bodyTextView.text.isEmpty
            && bodyTextView.text != "Description"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetail()
    }
    
    private func setupDetail() {
        guard let note = note else {
            titleTextField.placeholder = "Title"
            bodyTextView.text = "Description"
            deleteButton.isEnabled = false
            deleteButton.title = ""
            return
        }
        
        titleTextField.text = note.title
        bodyTextView.text = note.descriptions
    }

    @IBAction func saveNote(_ sender: UIBarButtonItem) {
        guard requiredFieldNotEmpty else {
            // showing alert field is empty
            return
        }
        
        let formater = DateFormatter()
        formater.dateFormat = "yyyy-MM-dd"
        
        let newNote = Note(
            id: note?.id,
            title: titleTextField.text!,
            descriptions: bodyTextView.text,
            date: formater.string(from: Date()),
            completed: false
        )
        
        if newNote.id != nil {
            APIService.F.updateNote(id: newNote.id!, note: newNote)
        } else {
            APIService.F.addNote(note: newNote)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteNote(_ sender: Any) {
        APIService.F.deleteNote(id: note!.id!)
        navigationController?.popViewController(animated: true)
    }
}
