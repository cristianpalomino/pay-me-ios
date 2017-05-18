//
//  DetalleReciboViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 10/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class DetalleReciboViewController: PMViewController {
    var cards :[Card] = []

    @IBOutlet var cTopChartView         :NSLayoutConstraint!
    @IBOutlet var cTopdetailCardView    :NSLayoutConstraint!
    @IBOutlet var cTopdetailView        :NSLayoutConstraint!
    
    @IBOutlet var headerView        :UIView!
    @IBOutlet var detailView        :UIView!
    @IBOutlet var detailCardView    :UIView!
    @IBOutlet var chartView         :UIView!

    @IBOutlet weak var monoTotal    :UILabel!
    @IBOutlet var imageChart        :UIImageView!
    @IBOutlet var tableCards        :UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension DetalleReciboViewController {
    
    override func initComponents() {
        cards = [Card(type: .DEFAULT, image: "logito-visa"),
                 Card(type: .INVALID, image: "logito-mastercard"),
                 Card(type: .INVALID, image: "logito-amex")]
    }
}

extension DetalleReciboViewController {
    
    @IBAction func tapDetail() {
        self.cTopdetailView.constant = -(self.detailView.frame.origin.y)
        self.detailView.isHidden = true
        self.detailCardView.isHidden = false
        
//        UIView.animate(withDuration: 0.15, animations: {
//            self.view.layoutIfNeeded()
//            self.detailView.isHidden = true
//            self.detailCardView.isHidden = false
//        }, completion: {
//            (finished :Bool) -> Void in
//        })
    }
    
    @IBAction func tapCards() {
        self.cTopdetailView.constant = 0
        self.detailView.isHidden = false
        self.detailCardView.isHidden = true
        
//        UIView.animate(withDuration: 0.15, animations: {
//            self.view.layoutIfNeeded()
//            self.detailView.isHidden = false
//            self.detailCardView.isHidden = true
//        }, completion: {
//            (finished :Bool) -> Void in
//        })
    }
    
    @IBAction func showChart() {
        if self.imageChart.isHidden {
            self.cTopdetailView.constant = -(self.detailView.frame.origin.y)
            self.cTopdetailCardView.constant = -(self.detailCardView.frame.origin.y)
            //self.cTopChartView.constant = 0
            
            self.imageChart.isHidden = false
            self.detailView.isHidden = true
            self.detailCardView.isHidden = true
        } else {
            self.cTopdetailView.constant = 0
            self.cTopdetailCardView.constant = 0
            //self.cTopChartView.constant = self.monoTotal.frame.origin.y
            
            self.imageChart.isHidden = true
            self.detailView.isHidden = false
            self.detailCardView.isHidden = true
        }
    }
}

extension DetalleReciboViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension DetalleReciboViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CardTableViewCell.identifier, for: indexPath) as! CardTableViewCell
        cell.item = cards[indexPath.row]
        return cell
    }
}
