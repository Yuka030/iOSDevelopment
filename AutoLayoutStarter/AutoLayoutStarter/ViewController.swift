//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let mainView: UIView = {
    let main = UIView()
    // important when setting contraints programmatically
    main.translatesAutoresizingMaskIntoConstraints = false
    main.backgroundColor = .green
    return main
  }()
    
    // purple box
   let purpleView: UIView = {
        let purple = UIView(frame: CGRect.zero)
        purple.translatesAutoresizingMaskIntoConstraints = false
        purple.backgroundColor = .purple
        return purple
    }()
    
    //stack view01
    let stackView01: UIStackView = {
        let stackView01 = UIStackView();
        stackView01.translatesAutoresizingMaskIntoConstraints = false
        stackView01.axis = .vertical;
        stackView01.distribution = .equalSpacing;
        stackView01.spacing = 30;
        
        // blue box01
        let blueView01: UIView = {
            let blue01 = UIView(frame:CGRect.zero)
            blue01.translatesAutoresizingMaskIntoConstraints = false
            blue01.backgroundColor = .blue
            NSLayoutConstraint.activate([
                blue01.widthAnchor.constraint(equalToConstant: 50),
                blue01.heightAnchor.constraint(equalToConstant: 50)
            ])
            return blue01
        }()
        
        // blue box02
        let blueView02: UIView = {
            let blue02 = UIView(frame:CGRect.zero)
            blue02.translatesAutoresizingMaskIntoConstraints = false
            blue02.backgroundColor = .blue
            NSLayoutConstraint.activate([
                blue02.widthAnchor.constraint(equalToConstant: 50),
                blue02.heightAnchor.constraint(equalToConstant: 50)
            ])
            return blue02
        }()
        
        // blue box03
        let blueView03: UIView = {
            let blue03 = UIView(frame:CGRect.zero)
            blue03.translatesAutoresizingMaskIntoConstraints = false
            blue03.backgroundColor = .blue
            NSLayoutConstraint.activate([
                blue03.widthAnchor.constraint(equalToConstant: 50),
                blue03.heightAnchor.constraint(equalToConstant: 50)
            ])
            return blue03
        }()
        
        stackView01.addArrangedSubview(blueView01)
        stackView01.addArrangedSubview(blueView02)
        stackView01.addArrangedSubview(blueView03)
        
        return stackView01
    }()
    
    //stack view02
    let stackView02: UIStackView = {
        let stackView02 = UIStackView();
        stackView02.translatesAutoresizingMaskIntoConstraints = false
        stackView02.axis = .horizontal;
        stackView02.distribution = .equalSpacing;
        stackView02.isLayoutMarginsRelativeArrangement = true
        stackView02.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        stackView02.backgroundColor = .red
        
        // orange box01
        let orangeView01: UIView = {
            let orange01 = UIView(frame: CGRect.zero)
            orange01.backgroundColor = .orange
            orange01.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                orange01.widthAnchor.constraint(equalToConstant: 100)
            ])
            return orange01
        }()
        
        // orange box02
        let orangeView02: UIView = {
            let orange02 = UIView(frame: CGRect.zero)
            orange02.backgroundColor = .orange
            orange02.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                orange02.widthAnchor.constraint(equalToConstant: 70)
            ])
            return orange02
        }()
        
        stackView02.addArrangedSubview(orangeView01)
        stackView02.addArrangedSubview(orangeView02)
        
        return stackView02
    }()
    
    // red box
    let redView: UIView = {
        let redbox = UIView(frame: CGRect.zero)
        redbox.backgroundColor = .red
        redbox.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            redbox.widthAnchor.constraint(equalToConstant: 200),
            redbox.heightAnchor.constraint(equalToConstant: 70)
        ])
        return redbox
    }()
    

  let squareButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Square", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
    return butt
  }()
  
  let portraitButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Portrait", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
    return butt
  }()
  
  let landScapeButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Landscape", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
    return butt
  }()
  
  var widthAnchor: NSLayoutConstraint?
  var heightAnchor: NSLayoutConstraint?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(mainView)
    setupLayout()
  }

  fileprivate func setupLayout() {
    mainView.addSubview(purpleView)
    NSLayoutConstraint.activate([
      purpleView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
      purpleView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20),
      purpleView.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.7),
      purpleView.heightAnchor.constraint(equalToConstant: 70)
    ])
    
    mainView.addSubview(stackView01)
    NSLayoutConstraint.activate([
      stackView01.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 70),
      stackView01.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -70),
      stackView01.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
      stackView01.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
    ])
    
    mainView.addSubview(redView)
    NSLayoutConstraint.activate([
      redView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
      redView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10)
    ])
    
    mainView.addSubview(stackView02)
    NSLayoutConstraint.activate([
      stackView02.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
      stackView02.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20),
      stackView02.widthAnchor.constraint(equalToConstant: 200),
      stackView02.heightAnchor.constraint(equalToConstant: 50),
    ])
    
    mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
    widthAnchor?.isActive = true
    
    heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
    heightAnchor?.isActive = true
    
    let buttstackView01 = UIStackView(arrangedSubviews: [
      squareButton, portraitButton, landScapeButton])
    buttstackView01.translatesAutoresizingMaskIntoConstraints = false
    buttstackView01.axis = .horizontal
    buttstackView01.alignment = .center
    buttstackView01.distribution = .fillEqually
    
    view.addSubview(buttstackView01)
    NSLayoutConstraint.activate([
      buttstackView01.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      buttstackView01.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttstackView01.heightAnchor.constraint(equalToConstant: 50),
      buttstackView01.widthAnchor.constraint(equalTo: view.widthAnchor)
      ])
  }

  @objc private func squareTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
  
  @objc private func portraitTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
    
  }
  
  @objc private func landscapeTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
}

