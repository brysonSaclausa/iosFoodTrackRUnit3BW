//
//  FoodtruckController.swift
//  iosFoodTruckTrackR
//
//  Created by BrysonSaclausa on 10/17/20.
//

import Foundation
import UIKit

class LoginController {
    
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case delete = "DELETE"
    }
    
    enum NetworkError: Error {
        case noData
        case failedSignUp
        case failedSignIn
        case noToken
        case tryAgain
        case noDecode
        case noEncode
        case noRep
    }
    
    var token: Bearer?
    var userId: Int?
    
    private let baseURL = URL(string:"https://build-week-food-truck.herokuapp.com/")!
    private lazy var signUpURL = baseURL.appendingPathComponent("api/diner/register")
    private lazy var loginURL = baseURL.appendingPathComponent("api/diner/login")
    
    private func postRequest(for url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }



    //MARK: - SIGNUP/LOGIN
    // create function for sign up
    func signUp(with diner: Diner, completion: @escaping (Result<Bool, NetworkError>) -> Void) {
        print("signUpURL = \(signUpURL.absoluteString)")
        var request = postRequest(for: signUpURL)
        do {
            let jsonData = try JSONEncoder().encode(diner)
            print(String(data: jsonData, encoding: .utf8)!)
            request.httpBody = jsonData

            let task = URLSession.shared.dataTask(with: request) { (_, response, error) in
                if let error = error {
                    print("SignUp Failed with error: \(error)")
                    completion(.failure(.failedSignUp))
                    return
                }
                guard let response = response as? HTTPURLResponse,
                      response.statusCode == 201 else {
                    print("Sign up was unsuccessful")
                    completion(.failure(.failedSignUp))
                    return
                }
                completion(.success(true))

            }
            task.resume()
        } catch {
            print("error encoding user: \(error)")
            completion(.failure(.failedSignUp))
        }
   }

    // create function for login
    func logIn(with diner: Diner, completion: @escaping (Result<Bool, NetworkError>) -> Void) {
        var request = postRequest(for: loginURL)
        do {
            let jsonData = try JSONEncoder().encode(diner)
            print(String(data: jsonData, encoding: .utf8)!)
            request.httpBody = jsonData
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Sign in failed with error: \(error)")
                    completion(.failure(.failedSignIn))
                    return
                }
                guard let response = response as? HTTPURLResponse,
                    response.statusCode == 200 else {
                        print("Sign in was unsuccessful")
                        completion(.failure(.failedSignIn))
                        return
                }
                guard let data = data else {
                    print("Data was not received")
                    completion(.failure(.noData))
                    return
                }
                // Getting the bearer and UserID
                do {

                    self.token = try JSONDecoder().decode(Bearer.self, from: data)
                   
                    print("token is: \(String(describing: self.token))")
                    self.token = try JSONDecoder().decode(Bearer.self, from: data)

                    completion(.success(true))
                } catch {
                    print("Error decoding bearer: \(error)")
                    completion(.failure(.noToken))
                }

            }
            task.resume()
        } catch {
            print("Error encoding user: \(error.localizedDescription)")
            completion(.failure(.failedSignIn))
        }
     }
    
//    MARK: - CRUD
//
//     create function for fetching all foodtruck objects
//
//     create function for fetching FTobjects in favorites array
//
//     create function for adding FTobject to favorites array
//
//     create function for deleting FTobject from favorites array
    
    
   
    
    
    
    
}
