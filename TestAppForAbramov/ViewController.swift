import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var color: UIColor?
    var titleForItem: String?
    let labelArray = ["Красные", "Зеленые", "Синие", "R:1.0, G: 0.75, B: 0.5 "]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let textColor = UIColor(named: "TextColor") else { return }
        
        tableView.rowHeight = 200
        button.layer.cornerRadius = button.frame.height / 5
        navigationController?.navigationBar.tintColor = textColor
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
        cell.delegate = self
        cell.selectionStyle = .none
        return cell
    }
}

extension ViewController: CollectionViewDelegate {
    
    func transferToColorVc(backgroundColor: UIColor, id: Int) {
        self.titleForItem = labelArray[id]
        self.color = backgroundColor
        performSegue(withIdentifier: "ShowColorVc", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? ColorViewController, segue.identifier == "ShowColorVc" {
            vc.colorForView = color
            vc.titleForItem = self.titleForItem
        }
    }
}
