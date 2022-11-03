//
//  ResumeViewController.swift
//  MyResume
//
//  Created by Eduardo Salcedo on 11/3/22.
//

import UIKit
import PDFKit //module that allows us to work with PDFs

class ResumeViewController: UIViewController {
    
    //MARK: - Instance Properties
    // create a property to store my resume
    let resume = Bundle.main.url(forResource: "Resume", withExtension: "pdf")
    let pdfView = PDFView()

    //MARK: - VDL
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Eduardo Salcedo"
        navigationController?.navigationBar.prefersLargeTitles = false
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        // we need to set this to false or pdf may not show in the view
        pdfView.translatesAutoresizingMaskIntoConstraints = false // makes it fit
        // add the pdf view to the view
        view.addSubview(pdfView)
        
        //unwrap our value - go get the pdf from this place:
        guard let path = Bundle.main.url(forResource: "Resume", withExtension: "pdf") else { return } // if there is nothing there, exit
        guard let document = PDFDocument(url: path) else { return }
    
        pdfView.document = document
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pdfView.frame = view.bounds
    }

    //MARK: - Instance Methods
    // An Objective-C function that will be called when the share button is tapped
    @objc func shareTapped() {
        guard let document = resume else { return }
        // creates the view that loads the array of item(s) to be shared - in this case, your resume
        let view = UIActivityViewController(activityItems: [document], applicationActivities: [])
        // show our view as a popover from the right bar button item (above, line 25)
        view.popoverPresentationController?.barButtonItem = navigationItem.backBarButtonItem
        
        // present the view when the share button is tapped
        present(view, animated: true)
    }

}
