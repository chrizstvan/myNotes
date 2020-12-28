//
//  ViewController.swift
//  myNotes
//
//  Created by Chris Stev on 28/12/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var notes = [Note]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        APIService.F.delegate = self
        
        APIService.F.getNotes()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        return cell
    }
}

extension ViewController: DataDelegate {
    func updateData(newData: String) {
        do {
            notes = try JSONDecoder().decode([Note].self, from: newData.data(using: .utf8)!)
            print("after parsing: \(notes)")
        } catch {
            print("Failed to parse data")
        }
    }
}

