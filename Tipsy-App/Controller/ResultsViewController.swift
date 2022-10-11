
import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var Lable: String?
    var realText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = Lable
        settingsLabel.text = realText
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
   
        self.dismiss(animated: true)
    
    }
    
    

}
