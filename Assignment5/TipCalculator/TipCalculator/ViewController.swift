import UIKit

class ViewController: UIViewController {

    @IBOutlet var billAmountTextField: UITextField!
    @IBOutlet var tipAmountLabel: UILabel!
    @IBOutlet var tipPercentageTextField: UITextField!
    @IBOutlet var adjustTipPercentage: UISlider!
    
     override func viewDidLoad() {
       super.viewDidLoad()
        
       NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
       NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
       
       let tabGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
       view.addGestureRecognizer(tabGestureRecognizer)
     }
    
    @IBAction func calculateTip(_ sender: UIButton) {
        if let amountText = billAmountTextField.text, let amount = Float(amountText), let tipPercentText = tipPercentageTextField.text, let tipPercent = Float(tipPercentText) {
            let tip = Float(amount) * (tipPercent / 100)
            tipAmountLabel.text = String.init(format: "$ %.2f", tip)
        } else {
            tipAmountLabel.text = "$ 0"
        }
    }
    
    @IBAction func showCalcResult(_ sender: UISlider) {
        tipPercentageTextField.text = String(Int(sender.value))
        calcTip()
    }
    
    func calcTip(){
        if let amountText = billAmountTextField.text, let amount = Float(amountText), let tipPercentText = tipPercentageTextField.text, let tipPercent = Float(tipPercentText) {
            let tip = Float(amount) * (tipPercent / 100)
            tipAmountLabel.text = String.init(format: "$ %.2f", tip)
        } else {
            tipAmountLabel.text = "$ 0"
        }
    }
    
     @objc func keyboardWillShow(notification: Notification) {
         if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
             if view.frame.origin.y == 0 {
                 view.frame.origin.y -= keyboardSize.height / 2
             }
         }
     }
     
     @objc func keyboardWillHide(notification: Notification) {
         if view.frame.origin.y != 0 {
             view.frame.origin.y = 0
         }
     }
     
     @objc func dismissKeyboard(_ recognizer: UITapGestureRecognizer) {
         billAmountTextField.resignFirstResponder()
         tipPercentageTextField.resignFirstResponder()
     }
    
}

