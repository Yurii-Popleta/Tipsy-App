
import UIKit

struct CalculateBrain {
    
    var percentageChosen = "0.0"
    
    var finalNumber = "0.0"
    
    //MARK: - Changes percentage buttons on true or false based on what button user choice, we will find this value on CalculatorViewController, also we change var percentageChosen.
    
    mutating func changePercentageButtons(curentButton: String, zero: UIButton, ten: UIButton, twenty: UIButton) {
        
        switch curentButton {
        case "0%":
            zero.isSelected = true
            ten.isSelected = false
            twenty.isSelected = false
        case "10%":
            zero.isSelected = false
            ten.isSelected = true
            twenty.isSelected = false
        default:
            zero.isSelected = false
            ten.isSelected = false
            twenty.isSelected = true
        }
        
        percentageChosen = curentButton
    }
    
    //MARK: - There we calculate values based on user choice, and based on var percentageChosen we change var finalNumber on value that user should see.
    
    mutating func calculateValue(_ numberOfPeople: String, _ billNumber: String) {
        
        guard let numberOfPeopleFloat = Float(numberOfPeople) else {return}
        guard let billNumberFloat = Float(billNumber) else {return}
        
        let calculate = billNumberFloat / numberOfPeopleFloat
        
        switch percentageChosen {
       
        case "0%":
            finalNumber = (String(format: "%.2f",calculate))
        case "10%":
            finalNumber = (String(format: "%.2f",calculate + calculate * 0.1))
        default:
            finalNumber = (String(format: "%.2f",calculate + calculate * 0.2))
        }
    }
    
}
