//
//  ViewController.swift
//  app-sorteio
//
//  Created by Maxwell Silva on 02/07/25.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Sorteio"
        title.textAlignment = .center
        title.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        title.textColor = .white
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var numberRandomLabel: UILabel = {
        let number = UILabel()
        number.text = "???"
        number.font = UIFont(name: "HelveticaNeue-CondensedBlack", size: 60)
        number.textColor = .white
        number.translatesAutoresizingMaskIntoConstraints = false
        return number
    }()

    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Gerar número", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.systemGray, for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        button.layer.backgroundColor = UIColor.white.cgColor
        button.layer.cornerRadius = 110
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutScreen()
        selectButtonResult()
    }
    
    func selectButtonResult() {
        startButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        generateNumberRandom()
    }
    
    func generateNumberRandom() {
        let numberRandom = Int.random(in: 1...100)
        print(numberRandom)
        
        numberRandomLabel.text = "\(numberRandom)"
        
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
    
    private func layoutScreen() {
        view.addSubview(backgroundImage)
        view.addSubview(titleLabel)
        view.addSubview(numberRandomLabel)
        view.addSubview(startButton)
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: self.view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            numberRandomLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 100),
            numberRandomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            startButton.topAnchor.constraint(equalTo: numberRandomLabel.bottomAnchor, constant: 100),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.widthAnchor.constraint(equalToConstant: 220),
            startButton.heightAnchor.constraint(equalToConstant: 220)
        ])
        
    }
}
