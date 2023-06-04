//
//  compareViewController.swift
//  testCoin
//
//  Created by Woramaet Chaichanasak on 2023/06/04.
//

import UIKit

class compareViewController: UIViewController {
    
    var A1:[Int] = [1, 2, 3, 4, 5, 6]
    let A2:[Int] = [3, 4, 5, 7, 8, 9]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var result = [Int]()
        
        for item1 in A1 {
            var isMatched = false
            
            for item2 in A2 {
                if item1 == item2 {
                    isMatched = true
                    break
                }
            }
            
            if isMatched {
                result.append(item1)
            }
            
            A1.removeAll()
            A1 = result
        }
        
    }
    


}
