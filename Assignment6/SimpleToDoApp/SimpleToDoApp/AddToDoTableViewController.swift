import UIKit

class AddToDoTableViewController: UITableViewController {

    @IBOutlet var todoTextField: UITextField!
    
    @IBOutlet var saveButton: UIBarButtonItem!
    static let unwindSequeId = "saveUnwind"
    var todo: Todo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let todo = todo {
            todoTextField.text = todo.title
        }
        
        validateTextField()
    }
    
     // 1. validate user input
    private func validateTextField(){
        let todoText = todoTextField.text ?? ""
        saveButton.isEnabled = !todoText.isEmpty
    }
    
    // 2. prepare for unwind segue (pass the data)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == AddToDoTableViewController.unwindSequeId {
            let todoText = todoTextField.text ?? ""
            todo = Todo(title: todoText, priority: 1)
        }
    }

    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        validateTextField()
    }
    
    @IBAction func returnKeyPressed(_ sender: UITextField) {
        // dismiss the keyboard
        sender.resignFirstResponder()
    }
    

}
