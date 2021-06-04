import UIKit

class ColorViewController: UIViewController {
    @IBOutlet weak var viewForColor: UIView!
    var colorForView: UIColor?
    var titleForItem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if colorForView != nil {        
            viewForColor.layer.backgroundColor = colorForView?.cgColor
        }
        
        navigationItem.title = titleForItem
    }
}
