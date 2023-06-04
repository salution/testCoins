//
//  historyViewController.swift
//  testCoin
//
//  Created by Woramaet Chaichanasak on 2023/06/04.
//

import UIKit

class historyViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setuptableView()
    }
    
    
    private func setuptableView(){
        self.tableView.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        
        self.tableView.rowHeight = UITableView.automaticDimension
                      
        self.tableView.estimatedRowHeight = 44.0
        
        self.tableView.separatorStyle = .singleLine
        
        self.tableView.separatorInset = UIEdgeInsets.zero
                      
        self.tableView.register(UINib(nibName: "priceTableViewCell", bundle: nil), forCellReuseIdentifier: "priceTableViewCell")
        
        
        self.tableView.contentSize = CGSize(width: self.tableView.frame.width, height: self.tableView.contentSize.height)
        
        self.tableView.allowsSelection = false
                      
        self.tableView.reloadData()
    }

    @IBAction func backClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension historyViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return History.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : priceTableViewCell = tableView.dequeueReusableCell(withIdentifier: "priceTableViewCell", for: indexPath) as! priceTableViewCell
        
        let h = History[indexPath.row]
        
        cell.labelDate.text = h.dateSave
        cell.labelUSD.text = h.usdPrice
        cell.labelGBP.text = h.gbpPrice
        cell.labelEUR.text = h.eurPrice
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    
}
