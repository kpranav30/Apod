//
//  ViewController.swift
//  Apod
//
//  Created by Pranav Kulkarni on 2/7/22.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var fetchButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var webView: WKWebView!
    
    var presenter: ApodPresenter?
    var apodViewData: Apod?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter = ApodPresenterImplementation(delegate: self)
        presenter?.apodForDate(date: Date())
        self.datePicker.maximumDate = Date()
    }
    
    @IBAction func fetchApodAction(_ sender: Any){
        presenter?.apodForDate(date: datePicker.date)
    }
    
    func updateApodDetailsText(){
        if let date = apodViewData?.date, let titleString = apodViewData?.title, let explanation = apodViewData?.explanation {
            let infoText: String = String("Date: \(date) \n Title: \(titleString) \n Explanation: \(explanation)")
            textView.text = infoText
        }
    }
    
    func updateUI(){
        loadImageOrVideo()
        updateApodDetailsText()
    }
    
    func loadImageOrVideo(){
        if let url = apodViewData?.url {
            webView.load(url)
        }
    }
}

extension ViewController: ApodPresenterDelegate {
    
    func receivedApodDetails(apod: Apod) {
        self.apodViewData = apod
        updateUI()
    }
    
    func didNotReceiveApodDetails() {
        let noDataAlert = UIAlertController(title: "Try changing date", message: "APOD not available or failed to retrieve APOD)", preferredStyle: .alert)
        noDataAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            // Nothing specific to do here.
        }))
        self.present(noDataAlert, animated: true, completion: nil)
    }
}
