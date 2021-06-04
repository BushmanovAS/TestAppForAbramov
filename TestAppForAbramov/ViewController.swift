//
//  ViewController.swift
//  TestAppForAbramov
//
//  Created by Антон Бушманов on 02.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var color: UIColor?
    
    let labelArray = ["Красные", "Зеленые", "Синие", "R:1.0, G: 0.75, B: 0.5 "]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 200
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! TableViewCell
        cell.label.text = labelArray[indexPath.row]
        cell.id = indexPath.row
        return cell
    }
}

extension ViewController: CollectionViewDelegate {
    
    func transferToColorVc(backgroundColor: UIColor) {
        self.color = UIColor.yellow
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? ColorViewController, segue.identifier == "ShowColorVc" {
            vc.colorForView = color
        }
    }
}
