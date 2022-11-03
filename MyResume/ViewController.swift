//
//  ViewController.swift
//  MyResume
//
//  Created by Eduardo Salcedo on 10/25/22.
//

import UIKit
import SafariServices //to add SFSafariViewControllerDelegate below

class ViewController: UIViewController, SFSafariViewControllerDelegate {

    // MARK: - IB Outlets
    

    
    // MARK: - Instance Properties
    let phoneNumber = "7862983357"
    
    //MARK: - VDL
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: - IB Actions
    @IBAction func callMeButtonTapped(_ sender: UIButton) {
        if let url = NSURL(string: "tel://\(phoneNumber)") {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
            // next line of code demonstrates that the call button will work on a physical device. This is inserted to demo functionality.
            // since the simulator cannot make a phone call, the next line will print a string to the console.
            print("A physical device would be calling my number. Voicemail will be automatically invoked (since I am calling my number from my own device).")
        }
        // NSURL stands for Next Step URL
        // "tel:// = URL scheme - used to access the telephone and access this value
    }
    
    @IBAction func skillsButtonTapped(_ sender: Any) {
        showWebPage()
    }
    
    
    //MARK: - Instance Methods
    func showWebPage() {
        // create a constant that will store a student's webpage or blog or portfolio as a string.
        let urlString = "https://www.swiftteacher.org"
        
        if let url = URL(string: urlString) {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            
            let view = SFSafariViewController(url: url, configuration: config)
            view.delegate = self
            present(view, animated: true)
        }
    }
    
}

