//
//  ViewController.swift
//  testCoin
//
//  Created by Woramaet Chaichanasak on 2023/06/04.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var textPrice: UITextView!
    @IBOutlet weak var textCurrency: UITextField!
    @IBOutlet weak var textAmmount: UITextField!
    @IBOutlet weak var textTotal: UILabel!
    
    var result = JSON()
    var timer: Timer!
    let picker = UIPickerView()
    
    let currency:[String] = ["USD", "GBP", "EUR"]
    var curSelect:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textCurrency.inputView = picker
        
        picker.delegate = self
        picker.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(updateP), name: UIApplication.didEnterBackgroundNotification, object: nil)
        
        startTimer()
        
        getPrice()
    }
    
    deinit {
            NotificationCenter.default.removeObserver(self)
        }
    
    private func getPrice(){
        let url = "https://api.coindesk.com/v1/bpi/currentprice.json"
        
        AF.request(url, method:.get).responseString { response in
            
            self.result = JSON((response.data))
            
            self.updatePrice()
        }
        
    }
    
    @objc func updateP() {
            // Perform the text update here
        self.getPrice()
    }
    
    private func updatePrice(){
        textPrice.text = "BTC update in \(result["time"]["updated"]) \n - USD : \(result["bpi"]["USD"]["rate_float"]) \n - GBP : \(result["bpi"]["GBP"]["rate_float"]) \n - EUR : \(result["bpi"]["EUR"]["rate_float"])"
        
        var p:Price = Price(usdPrice: result["bpi"]["USD"]["rate_float"].stringValue, gbpPrice: result["bpi"]["GBP"]["rate_float"].stringValue, eurPrice: result["bpi"]["EUR"]["rate_float"].stringValue, dateSave: result["time"]["updated"].stringValue)
        
        History.append(p)
        
    }
    
    
    func startTimer() {
            // Invalidate any existing timer
            timer?.invalidate()
            
            // Create a new timer that fires every 1 minute
            timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(updateP), userInfo: nil, repeats: true)
    }
    
    @IBAction func calPrice(_ sender: UITextField) {
        if sender.text?.count != 0{
            let amount:Double = Double(sender.text!) ?? 0.0
            let total = caling(am: amount)
            textTotal.text = "\(total) BTC"
        }
        else{
            textTotal.text = ""
        }
    }
    
    private func caling(am :Double) -> Double{
        var total = Double()
        
        if curSelect == "USD"{
            let cur:Double = result["bpi"]["USD"]["rate_float"].doubleValue
            total = am / cur
        }
        else if curSelect == "GBP"{
            let cur:Double = result["bpi"]["GBP"]["rate_float"].doubleValue
            total = am / cur
        }
        else if curSelect == "EUR"{
            let cur:Double = result["bpi"]["EUR"]["rate_float"].doubleValue
            total = am / cur
        }
        else{
            total = 0.0
        }
        
        return total
    }
    
    @IBAction func historyClicked(_ sender: UIButton) {
        let vc:historyViewController = self.storyboard?.instantiateViewController(withIdentifier: "history") as! historyViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func bonusClicked(_ sender: UIButton) {
        let vc: bonusViewController = self.storyboard?.instantiateViewController(withIdentifier: "bonus") as! bonusViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ViewController:UIPickerViewDelegate,UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currency.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currency[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        textCurrency.text = currency[row]
        curSelect = currency[row]
        
    }
}

