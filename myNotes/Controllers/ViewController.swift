//
//  ViewController.swift
//  myNotes
//
//  Created by Chris Stev on 28/12/20.
//

//checkmark.circle.fill
import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var notes = [Note]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        APIService.F.delegate = self
        tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // fetch data
        APIService.F.getNotes()
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = notes[indexPath.row].title
        cell.detailTextLabel?.text = notes[indexPath.row].descriptions
        cell.imageView?.image = notes[indexPath.row].completed ?
            UIImage(systemName: "checkmark.circle.fill") : UIImage(systemName: "clock.arrow.circlepath")
        return cell
    }
}

extension ViewController: DataDelegate {
    func updateData(newData: String) {
        do {
            notes = try JSONDecoder().decode([Note].self, from: newData.data(using: .utf8)!)
            tableView.reloadData()
        } catch {
            print("Failed to parse data")
        }
    }
}

