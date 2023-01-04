//
//  MainView.swift
//  Core Data App
//
//  Created by lucas meireles on 27/12/22.
//

import UIKit

protocol ViewControllerDelegate:AnyObject{
    func tappedGetAllDogguinhos()
    func tappedInsertDog()
    func tappedDeleteDog()
}


class MainView: UIView {
    
    private weak var delegate:ViewControllerDelegate?
        public func delegate(delegate:ViewControllerDelegate?){
            self.delegate = delegate
        }
    
    lazy var inputTextView: UITextField = {
        let input = UITextField()
        input.translatesAutoresizingMaskIntoConstraints = false
        input.text = "Dog 01"
        return input
    }()
    
    lazy var labelTextView: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .black
        text.font = UIFont.boldSystemFont(ofSize: 20)
        text.sizeToFit()
        text.text = "Core Data test"
        text.numberOfLines = 3
        return text
    }()
    
    lazy var buttonViewGetDogs: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Get all dogginhos", for: .normal)
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        bt.setTitleColor(.white, for: .normal)
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 8
        bt.titleLabel?.textAlignment = .center
        bt.backgroundColor = UIColor.purple
        bt.addTarget(self, action: #selector(tappedGetAllDogguinhos), for: .touchUpInside)
        return bt
    }()
    
    @objc func tappedGetAllDogguinhos(){
            delegate?.tappedGetAllDogguinhos()
        }
    
    lazy var buttonViewInsertDog: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Insert Dog", for: .normal)
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        bt.setTitleColor(.white, for: .normal)
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 8
        bt.titleLabel?.textAlignment = .center
        bt.backgroundColor = UIColor.purple
        bt.addTarget(self, action: #selector(tappedInsertDog), for: .touchUpInside)
        return bt
    }()
    
    @objc func tappedInsertDog(){
            delegate?.tappedInsertDog()
        }
    
    lazy var buttonViewDeleteDog: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Delete Dog", for: .normal)
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        bt.setTitleColor(.white, for: .normal)
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 8
        bt.titleLabel?.textAlignment = .center
        bt.backgroundColor = UIColor.purple
        bt.addTarget(self, action: #selector(tappedDeleteDog), for: .touchUpInside)
        return bt
    }()
    
    @objc func tappedDeleteDog(){
            delegate?.tappedDeleteDog()
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
        self.addSubview(self.labelTextView)
        self.addSubview(self.buttonViewGetDogs)
        self.addSubview(self.buttonViewInsertDog)
        self.addSubview(self.buttonViewDeleteDog)
        self.addSubview(self.inputTextView)
        
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            //text advice
            self.labelTextView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
            self.labelTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.labelTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
            
            self.inputTextView.topAnchor.constraint(equalTo: labelTextView.bottomAnchor, constant: 100),
            self.inputTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
            
            self.buttonViewGetDogs.topAnchor.constraint(equalTo: inputTextView.bottomAnchor, constant: 100),
            self.buttonViewGetDogs.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
            
            self.buttonViewInsertDog.topAnchor.constraint(equalTo: buttonViewGetDogs.bottomAnchor, constant: 100),
            self.buttonViewInsertDog.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
            
            self.buttonViewDeleteDog.topAnchor.constraint(equalTo: buttonViewInsertDog.bottomAnchor, constant: 100),
            self.buttonViewDeleteDog.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
        ])
    }
}
