//
//  primeViewController.swift
//  testCoin
//
//  Created by Woramaet Chaichanasak on 2023/06/04.
//

import UIKit

class primeViewController: UIViewController {

    @IBOutlet weak var textNum: UITextField!
    @IBOutlet weak var textResult: UITextView!
    
    override func viewDidLoad() { super.viewDidLoad() }
    
    @IBAction func generateClicked(_ sender: UIButton) {
        if textNum.text?.count != 0{
            let num = Int(textNum.text!) ?? 0
            
            let primeNum = getPrimeDigits(num)
            
            textResult.text = primeNum.map{ String($0) }.joined(separator: ", ")
        }
    }
    
    func getPrimeDigits(_ count: Int) -> [Int] {
            var primeDigits = [Int]()
            var number = 2
            
            while primeDigits.count < count {
                if isPrime(number) {
                    primeDigits.append(number)
                }
                number += 1
            }
            
            return primeDigits
        }
        
        func isPrime(_ number: Int) -> Bool {
            guard number > 1 else {
                return false
            }
            
            for i in 2..<number {
                if number % i == 0 {
                    return false
                }
            }
            
            return true
        }

    @IBAction func backClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
