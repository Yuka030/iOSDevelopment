import UIKit

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet var todoLabel: UILabel!
    
    func updateUI(with todo: Todo){
        todoLabel.text = todo.title
    }

}
