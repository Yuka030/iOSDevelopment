import UIKit

class ViewController: UIViewController {

    @IBOutlet var navBar: UINavigationBar!
    
    @IBOutlet var navBarConstraintHeight: NSLayoutConstraint!
    
    @IBOutlet var plusButton: UIButton!
    
    var isActive: Bool = false;
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 10
        stack.backgroundColor = .cyan
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.addSubview(stackView)
        stackView.widthAnchor.constraint(equalTo: navBar.widthAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: navBar.topAnchor, constant: 100).isActive = true
        stackView.bottomAnchor.constraint(equalTo: navBar.bottomAnchor, constant: -20).isActive = true
        let oreos = UIImageView()
        oreos.image = UIImage(named: "oreos")
        let pizzaPockets = UIImageView()
        pizzaPockets.image = UIImage(named: "pizza_pockets")
        let popTarts = UIImageView()
        popTarts.image = UIImage(named: "pop_tarts")
        let popsicle = UIImageView()
        popsicle.image = UIImage(named: "popsicle")
        let ramen = UIImageView()
        ramen.image = UIImage(named: "ramen")
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
}

