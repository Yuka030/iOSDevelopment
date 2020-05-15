import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet var navBar: UINavigationBar!
    
    @IBOutlet var navBarConstraintHeight: NSLayoutConstraint!
    
    @IBOutlet var plusButton: UIButton!
    
    private var isActive: Bool = false;
    private let cellId = "snackCell"
    var snacks = [String]()
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 10
        stack.backgroundColor = .cyan
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = UIColor.systemPink
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        setupTableView()
        navBar.addSubview(stackView)
        stackView.widthAnchor.constraint(equalTo: navBar.widthAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: navBar.topAnchor, constant: 100).isActive = true
        stackView.bottomAnchor.constraint(equalTo: navBar.bottomAnchor, constant: -20).isActive = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: navBar.bottomAnchor).isActive = true
        
        var snackImageViews: [UIImageView] = []
        
        let oreos = UIImageView()
        oreos.image = UIImage(named: "oreos")
        snackImageViews.append(oreos)
        
        let pizzaPockets = UIImageView()
        pizzaPockets.image = UIImage(named: "pizza_pockets")
        snackImageViews.append(pizzaPockets)
        
        let popTarts = UIImageView()
        popTarts.image = UIImage(named: "pop_tarts")
        snackImageViews.append(popTarts)
        
        let popsicle = UIImageView()
        popsicle.image = UIImage(named: "popsicle")
        snackImageViews.append(popsicle)
        
        let ramen = UIImageView()
        ramen.image = UIImage(named: "ramen")
        snackImageViews.append(ramen)
        
        var count = 0;
        for view in snackImageViews {
            view.tag = count;
            view.isUserInteractionEnabled = true;
            let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
            view.addGestureRecognizer(tap)
            count += 1
        }
        
        stackView.addArrangedSubview(oreos)
        stackView.addArrangedSubview(pizzaPockets)
        stackView.addArrangedSubview(popTarts)
        stackView.addArrangedSubview(popsicle)
        stackView.addArrangedSubview(ramen)
        
    }
    
    @IBAction func plusButtonPressed(_ sender: UIButton) {
        if isActive {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
                self.navBarConstraintHeight.constant = 80
                self.plusButton.transform = .identity
                self.stackView.isHidden = true
                self.view.layoutIfNeeded()
            })
            isActive = false
            
        }else {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
                self.navBarConstraintHeight.constant = 200
                self.plusButton.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi)/4)
                self.stackView.isHidden = false
                self.view.layoutIfNeeded()
            })
            isActive = true;
        }
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil){
        if let selected = sender?.view?.tag {
            switch selected {
            case 0:
               snacks.append("Oreo")
            case 1:
                snacks.append("Pizza Pockets")
            case 2:
                snacks.append("Pop Tarts")
            case 3:
                snacks.append("Pop Sicle")
            case 4:
                snacks.append("Ramen")
            default:
                break
            }
        }
        tableView.reloadData()

    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SnacksTableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return snacks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SnacksTableViewCell
      let snack = snacks[indexPath.row]
      cell.snackNameLabel.text = "\(snack)"
      return cell
    }
}


