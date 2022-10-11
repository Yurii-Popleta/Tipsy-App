
import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var calculateBrain = CalculateBrain()
    
    //MARK: - Changes percentage buttons by structure "CalculateBrain" and turn Off Text Field when user tap button.
    
    @IBAction func tipChanged(_ sender: UIButton) {
      
        if let safeCurrentTitle = sender.currentTitle {
            
        calculateBrain.changePercentageButtons(curentButton: safeCurrentTitle, zero: zeroPctButton, ten: tenPctButton, twenty: twentyPctButton)
        }
     
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
   
        splitNumberLabel.text = String(format: "%.0f",sender.value)
    }
    
   //MARK: - Sending to the structure "CalculateBrain" numberOfPeople, billNumber and then go to the second screen with changing some parameters on this screen before user will see that second screen.
     
    @IBAction func calculatePressed(_ sender: UIButton) {

        guard let numberOfPeople = splitNumberLabel.text else {return}
        guard let billNumber = billTextField.text else {return}
        
        calculateBrain.calculateValue(numberOfPeople, billNumber)
        billTextField.text = ""
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
        let secondScreen = segue.destination as! ResultsViewController
            
            secondScreen.Lable = calculateBrain.finalNumber
            secondScreen.realText = "Split between \(splitNumberLabel.text!) people, with \(calculateBrain.percentageChosen) tip."
        }
    }

}

