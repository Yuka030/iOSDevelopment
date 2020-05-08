import UIKit

class ToDoTableViewController: UITableViewController {
    struct SequeIdentifier {
        static let addTodo = "AddTodo"
        static let editTodo = "EditTodo"
    }
    
    private let cellId = "TodoCell"
    var todos: [Todo] = [
        Todo(title: "Test Todo01", priority: 1)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SequeIdentifier.editTodo {
            // need to know where a user tapped (indexPath)
            let indexPath = tableView.indexPathForSelectedRow!

            // get the todo info
            let todo = todos[indexPath.row]

            // pass the data to AddToDo
            let navController = segue.destination as! UINavigationController
            let addToDoTVC = navController.topViewController as! AddToDoTableViewController
            addToDoTVC.todo = todo
        }
    }
    
    @IBAction func unwindToToDoTableView(segue: UIStoryboardSegue){
        if segue.identifier == AddToDoTableViewController.unwindSequeId {
            let sourceVC = segue.source as! AddToDoTableViewController
            if let todo = sourceVC.todo {
                
                if let selectedIndexPath = tableView.indexPathForSelectedRow {
                    // edit
                    todos[selectedIndexPath.row] = todo
                    tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
                } else {
                    // add
                    todos.append(todo)
                    tableView.insertRows(at: [IndexPath(row: todos.count - 1, section: 0)], with: .automatic)
                }
            }
        }
    }
    
    // MARK: - table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1. dequeue reusable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ToDoTableViewCell
        
        // 2. configure the cell (get the actual data from the list)
        let todo = todos[indexPath.row]
        cell.updateUI(with: todo)
        
        // 3. return the cell
        return cell
    }
    
    // MARK: - table view delegate
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // update the model
            todos.remove(at: indexPath.row)

            // udpate the table view
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
    }
    
//    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        return .delete
//    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let todoToMove = todos.remove(at: sourceIndexPath.row)
        todos.insert(todoToMove, at: destinationIndexPath.row)
    }
    
}
