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


}
