import UIKit

class SnacksTableViewCell: UITableViewCell {

    let snackNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(snackNameLabel)
        NSLayoutConstraint.activate([
            snackNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            snackNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            snackNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            snackNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
