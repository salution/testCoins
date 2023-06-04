//
//  bonusViewController.swift
//  testCoin
//
//  Created by Woramaet Chaichanasak on 2023/06/04.
//

import UIKit

class bonusViewController: UIViewController {

    override func viewDidLoad() { super.viewDidLoad() }
    
    @IBAction func fibClicked(_ sender: UIButton) {
        let vc:fibViewController = self.storyboard?.instantiateViewController(withIdentifier: "fib") as! fibViewController
        
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func primeClicked(_ sender: UIButton) {
        let vc:primeViewController = self.storyboard?.instantiateViewController(withIdentifier: "prime") as! primeViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func backClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func compareClicked(_ sender: UIButton) {
        let vc:compareViewController = self.storyboard?.instantiateViewController(withIdentifier: "compare") as! compareViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
