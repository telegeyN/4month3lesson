//
//  LoginViewController.swift
//  4month3lesson
//
//  Created by Telegey Nurbekova on 20/02/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let loginLabel = MakerView().makerLabel(text: "Login", font: Fonts.boldOutfit.size(18) ,textColor: .init(hex: "#000000"))
    private let userLogoImage = MakerView().makerImage(imageName: "person")
    private let welcomeLabel = MakerView().makerLabel(text: "Welcome back , Rohit Thakur")
    private let logoImage = MakerView().makerImage(imageName: "logo")
    private let enterLabel = MakerView().makerLabel(text: "Enter Your Mobile Number", font: Fonts.bold.size(17), textColor: .init(hex: "#F2796B"), textAlignment: .center)
    private let enterTF = MakerView().makerTextField(placeholder: "Enter Number")
    private let changeButton = MakerView().makerButton(title: "Change Number ?")
    private let loginButton = MakerView().makerButton(backgroundColor: .init(hex: "#F2796B"), title: "Login", titleColor: .white, titleFont: Fonts.regular.size(15))
    private let googleImage = MakerView().makerImage(imageName: "google")
    private let googleLabel = MakerView().makerLabel(text: "Google", font: Fonts.regular.size(14), textColor: .black)
    private let askLabel = MakerView().makerLabel(text: "You Don’t have an account?",font: Fonts.light.size(12) , textColor: .init(hex: "#000000", alpha: 0.8) )
    private let signUpButton = MakerView().makerButton(title: "Sign Up", titleColor: .init(hex: "#000000", alpha: 0.6), titleFont: Fonts.bold.size(12))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpUI2()
    }
    
    private func setUpUI(){
        
        view.backgroundColor = .init(hex: "#F6F6F6")
        
        //login label
        view.addSubview(loginLabel)
        NSLayoutConstraint.activate(
            [loginLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 62),
             loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24)
            ])
        
        //user logo image
        view.addSubview(userLogoImage)
        NSLayoutConstraint.activate(
            [userLogoImage.centerYAnchor.constraint(equalTo: loginLabel.centerYAnchor),
             userLogoImage.leadingAnchor.constraint(equalTo: loginLabel.trailingAnchor, constant: 2),
             userLogoImage.heightAnchor.constraint(equalToConstant: 19),
             userLogoImage.widthAnchor.constraint(equalToConstant: 20)
            ])
        
        //welcome label
        view.addSubview(welcomeLabel)
        NSLayoutConstraint.activate(
            [welcomeLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 5),
             welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24)
            ])
        
        //logo image
        view.addSubview(logoImage)
        NSLayoutConstraint.activate(
            [logoImage.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 24),
             logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             logoImage.heightAnchor.constraint(equalToConstant: 231),
             logoImage.widthAnchor.constraint(equalToConstant: 296)
            ])
        
        //enter label
        view.addSubview(enterLabel)
        NSLayoutConstraint.activate(
            [enterLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 10),
             enterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        
        //enter tf
        view.addSubview(enterTF)
        NSLayoutConstraint.activate(
            [enterTF.topAnchor.constraint(equalTo: enterLabel.bottomAnchor,constant: 24),
             enterTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23),
             enterTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -23),
             enterTF.heightAnchor.constraint(equalToConstant: 43)
            ])
    }
    
    private func setUpUI2(){
        
        //change button
        view.addSubview(changeButton)
        NSLayoutConstraint.activate(
            [changeButton.topAnchor.constraint(equalTo: enterTF.bottomAnchor,constant: 5),
             changeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
            ])
        
        //login button
        view.addSubview(loginButton)
        NSLayoutConstraint.activate(
            [loginButton.topAnchor.constraint(equalTo: changeButton.bottomAnchor,constant: 24),
             loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23),
             loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -23),
             loginButton.heightAnchor.constraint(equalToConstant: 43)
            ])
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        
        //google logo
        view.addSubview(googleImage)
        NSLayoutConstraint.activate(
            [googleImage.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 28),
             googleImage.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: -25),
             googleImage.heightAnchor.constraint(equalToConstant: 24),
             googleImage.widthAnchor.constraint(equalToConstant: 24)
            ])
        
        //google label
        view.addSubview(googleLabel)
        NSLayoutConstraint.activate(
            [googleLabel.centerYAnchor.constraint(equalTo: googleImage.centerYAnchor),
             googleLabel.leadingAnchor.constraint(equalTo: googleImage.trailingAnchor,constant: 5)
            ])
        
        //ask button
        view.addSubview(askLabel)
        NSLayoutConstraint.activate(
            [askLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -10),
             askLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90)
            ])
        
        //signup button
        view.addSubview(signUpButton)
        NSLayoutConstraint.activate(
            [signUpButton.centerYAnchor.constraint(equalTo: askLabel.centerYAnchor),
             signUpButton.leadingAnchor.constraint(equalTo: askLabel.trailingAnchor, constant: 5)
            ])
    }
    
    @objc private func loginTapped(_ sender: UIButton) {
        if let phoneNumber = enterTF.text {
            let digitsAndPlus = CharacterSet.decimalDigits.union(CharacterSet(charactersIn: "+"))
            if phoneNumber.rangeOfCharacter(from: digitsAndPlus.inverted) == nil {
                if isValidKyrgyzstanNumber(phoneNumber) {
                    let vc = ContactsViewController()
                    navigationController?.pushViewController(vc, animated: true)
                } else {
                    let alert = UIAlertController(title: "Invalid number!", message: "Please enter a valid Kyrgyzstan phone number in one of the following formats:\n1) +996XXXXXXXXX\n2) 996XXXXXXXXX\n3) 0XXXXXXXXX\nwhere X is a digit.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    present(alert, animated: true, completion: nil)
                }
            } else {
                let alert = UIAlertController(title: "Invalid input!", message: "Please enter only digits (0-9) or '+' in the phone number field.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            }
        }
    }
    
    private func isValidKyrgyzstanNumber(_ phoneNumber: String) -> Bool {
        if phoneNumber.hasPrefix("996") && phoneNumber.count == 12 {
            return true
        } else if phoneNumber.hasPrefix("+996") && phoneNumber.count == 13 {
            return true
        } else if phoneNumber.hasPrefix("0") && phoneNumber.count == 10 {
            return true
        } else {
            return false
        }
        
    }
}
