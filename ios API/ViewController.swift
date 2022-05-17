//
//  ViewController.swift
//  ios API
//
//  Created by Apple Esprit on 20/4/2022.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var scoreAvatar1TF: UITextField!
    
    @IBOutlet weak var scoreAvatar2TF: UITextField!
    
    @IBOutlet weak var scoreAvatar3TF: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func AddAccountBnt(_ sender: Any) {
        guard let email = emailTF.text, !email.isEmpty else { return }
        guard let scoreAvatar1 = scoreAvatar1TF.text, !scoreAvatar1.isEmpty else { return }
        guard let scoreAvatar2 = scoreAvatar2TF.text, !scoreAvatar2.isEmpty else { return }
        guard let scoreAvatar3 = scoreAvatar3TF.text, !scoreAvatar3.isEmpty else { return }
        
        let url = "http://localhost:3000/addaccount"
        let parameters = [
        
            "email" : email,
            "scoreAvatar1" : scoreAvatar1,
            "scoreAvatar2" : scoreAvatar2,
            "scoreAvatar3" : scoreAvatar3
            
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode : 200..<300)
            .responseJSON{ response in
                
                switch response.result
                {
                case .failure(let error):
                    print(error)
                    
                case .success(let value):
                    print(value)
                }
                
            }
        
    }
    
}

