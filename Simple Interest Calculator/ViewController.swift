
/*  ViewController.swift
 iOS Development - MAPD 714 (Assignment 01)

Simple Interest Calculator, version 1.0.0
 
This is a simple application to calculate the simple interest
earned from a principal amount invested for a given period of
time at a certain interest rate.

Created by Muindo Gituku, ID 301372521, on 2023-09-14.
 
 */


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonClear: UIButton!
    @IBOutlet weak var buttonCalculate: UIButton!
    @IBOutlet weak var resultInterest: UILabel!
    @IBOutlet weak var resultTotal: UILabel!
    @IBOutlet weak var inputTime: UITextField!
    @IBOutlet weak var inputRate: UITextField!
    @IBOutlet weak var inputPrincipal: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //initialize the two result labels with a zero value each
        resultInterest.text = "0.00"
        resultTotal.text = "0.00"
    }

    @IBAction func actionCalculate(_ sender: Any) {
        
        //convert the input strings to Doubles
        // ??0.0 is placed to ensure that incase nothing is entered or an invalid value is used, the double will always be zero in these cases
        let timeDouble = Double(inputTime.text!) ?? 0.0
        let rateDouble = Double(inputRate.text!) ?? 0.0
        let principalDouble = Double(inputPrincipal.text!) ?? 0.0
        
        //apply the simple interest formula
        let interestDouble = (timeDouble*rateDouble*principalDouble)/100
        let amountDouble = interestDouble+principalDouble
        
        let formatter = NumberFormatter()

        // Set up the NumberFormatter to use a thousands separator
        formatter.usesGroupingSeparator = true
        formatter.groupingSize = 3

        //Set it up to always display 2 decimal places.
        formatter.alwaysShowsDecimalSeparator = true
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        resultInterest.text = formatter.string(from:NSNumber(value:interestDouble))
        resultTotal.text = formatter.string(from:NSNumber(value:amountDouble))
    }
    
    @IBAction func actionClear(_ sender: Any) {
        //clear the input fields
        inputRate.text = ""
        inputTime.text = ""
        inputPrincipal.text = ""
        
        //reset the values of the result labels to zero
        resultInterest.text = "0.00"
        resultTotal.text = "0.00"
    }
}

