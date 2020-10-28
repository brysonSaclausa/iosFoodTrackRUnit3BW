//
//  LoginViewController.swift
//  iosFoodTruckTrackR
//
//  Created by BrysonSaclausa on 10/17/20.
//

import UIKit

enum LoginType {
    case signUp
    case login
}

class LoginViewController: UIViewController {
    
    
    
    //MARK: - IBOUTLETS
    @IBOutlet weak var signUpSegmentedControl: UISegmentedControl!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    var foodtruckController : LoginController?
    var loginType = LoginType.signUp
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backItem?.accessibilityLabel = String("loginViewController.backButton")
        //self.navigationController.navigationBar.backItem.setAccessibilityLabel("your string")
        passwordTextfield.isSecureTextEntry = true
    
    }

    //MARK: Action Handlers
    @IBAction func buttonTapped(_ sender: Any) {
        if let firstName = firstNameTextField.text,
           !firstName.isEmpty,
           let lastName = lastNameTextField.text,
           !lastName.isEmpty,
           let email = emailTextField.text,
           !email.isEmpty,
           let username = usernameTextField.text,
           !username.isEmpty,
           let password = passwordTextfield.text,
           !password.isEmpty {
            
            let diner = Diner(email: email, username: username, password: password, firstName: firstName, lastName: lastName)
            
            
            switch loginType {
            case .signUp:
                foodtruckController?.signUp(with: diner, completion: { result in
                    do {
                        let success = try result.get()
                        if success {
                            DispatchQueue.main.async {
                                print("sign up success")
                                let alertController = UIAlertController(title: "Sign Up Successful", message: "Now, please login", preferredStyle: .alert)
                                let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                                alertController.addAction(alertAction)
                                self.present(alertController, animated: true) {
                                    self.loginType = .login
                                    self.signUpSegmentedControl.selectedSegmentIndex = 1
                                    self.signUpButton.setTitle("Login", for: .normal)
                                }
                            }
                        }
                    } catch {
                        print("Error signing up: \(error)")
                        DispatchQueue.main.async {
                            let alertController = UIAlertController(title: "Oops, something went wrong!", message: "Try Again", preferredStyle: .alert)
                            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                            alertController.addAction(alertAction)
                            self.present(alertController, animated: true) {
                                self.loginType = .login
                                self.signUpSegmentedControl.selectedSegmentIndex = 1
                                self.signUpButton.setTitle("Login", for: .normal)
                            }
                        }
                        
                    }
                })
            case .login:
                foodtruckController?.logIn(with: diner, completion: { result in
                    do {
                        let success = try result.get()
                        
                        if success {
                            DispatchQueue.main.async {
                                print("success!")
                                let alertController = UIAlertController(title: "Login Successful", message: nil, preferredStyle: .alert)
                                let alertAction = UIAlertAction(title: "OK", style: .default) { (_) in
                                    self.navigationController?.popViewController(animated: true)
                                }
                                alertController.addAction(alertAction)
                                self.present(alertController, animated: true)
                                
                                
                               
                                
                            }
                        }
                    } catch {
                        if let error = error as? LoginController.NetworkError {
                            DispatchQueue.main.async {
                            switch error {
                            case .failedSignIn:
                                print("sign in failed")
                                let alertController = UIAlertController(title: "Sign In Failed", message: "Please, try again", preferredStyle: .alert)
                                let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                                alertController.addAction(alertAction)
                                self.present(alertController, animated: true)
                            case .noData:
                                print("no data recieved")
                                let alertController = UIAlertController(title: "No data recieved", message: "Please, try again", preferredStyle: .alert)
                                let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                                alertController.addAction(alertAction)
                                self.present(alertController, animated: true)
                            case .noToken:
                                print("no token")
                                let alertController = UIAlertController(title: "No token", message: "Please, try again", preferredStyle: .alert)
                                let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                                alertController.addAction(alertAction)
                                self.present(alertController, animated: true)
                            default:
                                print("other error occurred")
                                let alertController = UIAlertController(title: "Oops! Something went wrong!", message: "Please, try again", preferredStyle: .alert)
                                let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                                alertController.addAction(alertAction)
                                self.present(alertController, animated: true)
                            }
                            }
                        }
                    }
                })
            }
        }
        
        
        
        
        
    }
    @IBAction func SignInTypeChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            loginType = .signUp
            signUpButton.setTitle("Sign Up", for: .normal)
        } else {
            loginType = .login
            signUpButton.setTitle("Login", for: .normal)
            firstNameTextField.isHidden = true
            lastNameTextField.isHidden = true
            emailTextField.isHidden = true
        }
    }
    
    
    



    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
