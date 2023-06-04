//
//  fibViewController.swift
//  testCoin
//
//  Created by Woramaet Chaichanasak on 2023/06/04.
//

import UIKit

class fibViewController: UIViewController {

    @IBOutlet weak var textNum: UITextField!
    @IBOutlet weak var textFib: UITextView!
    
    override func viewDidLoad() { super.viewDidLoad() }
    
    @IBAction func generateClicked(_ sender: UIButton) {
        if textNum.text?.count != 0{
            let num = Int(textNum.text!) ?? 0
            
            let result = fibonacciGenerator(n: num)
            
            textFib.text = result.map { String($0) }.joined(separator: ", ")
        }
    }
    
    func fibonacciGenerator(n: Int) -> [Int] {
        var fibonacciDefult = [0, 1]
        
        guard n > 2 else {
            return Array(fibonacciDefult.prefix(n))
        }
        
        for _ in 2..<n {
            let nextFibonacciNumber = fibonacciDefult[fibonacciDefult.count - 1] + fibonacciDefult[fibonacciDefult.count - 2]
            fibonacciDefult.append(nextFibonacciNumber)
        }
        
        return fibonacciDefult
    }
    
    @IBAction func backClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
