//
//  PayTicketViewController.swift
//  payme
//
//  Created by Franco Paredes on 9/05/17.
//  Copyright © 2017 Alignet. All rights reserved.
//

import UIKit

class PayTicketViewController: PMViewController{
    var ticketFooterView: TicketFooterView?
    var ticketHeaderView: TicketHeaderView?
    
    @IBOutlet weak var cardsScrollView: UIScrollView!
    @IBOutlet weak var customerImageView: UIImageView!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var tableview: UITableView!
    
    var dataArray: Array = [["Comercio ejemplo S.A.C.", "5 items x S/ 17.84", "S/ 175,03"]
        ,["Arroz granel Costeño 50 kg.", "1 item x S/ 81.76", "S/ 81,76"]
        ,["Colchon Konfort King Size", "2 items x S/ 759.99", "S/ 1519,98"]
        ,["Galleta Chips Ahoy Six Pack", "1 items x S/ 9.23", "S/ 9,23"]
        ,["Comercio ejemplo S.A.C.", "5 items x S/ 17.84", "S/ 175,03"]
        ,["Arroz granel Costeño 50 kg.", "1 item x S/ 81.76", "S/ 81,76"]
        ,["Colchon Konfort King Size", "2 items x S/ 759.99", "S/ 1519,98"]
        ,["Galleta Chips Ahoy Six Pack", "1 items x S/ 9.23", "S/ 9,23"]
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initUI()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUI()
        // backs functions.
    }

    func setUI() -> Void {
        //self.tabBarController?.tabBar.isHidden = true
        self.tabBarController?.setTabBarVisible(visible: false, duration: 0.3, animated: true)

        self.navigationController?.isNavigationBarHidden = false
        self.hideKeyboardWhenTappedAround()
//      self.omitirButton.setGradientBackground()

    }
    
    func initUI() -> Void
    {
        ticketFooterView = Bundle.main.loadNibNamed("TicketFooterView",
                                                                      owner: nil,
                                                                      options: nil)?.first as? TicketFooterView
   
       ticketHeaderView = Bundle.main.loadNibNamed("TicketHeaderView",
                                                                      owner: nil,
                                                                      options: nil)?.first as? TicketHeaderView
  
        self.nextButton.setGradientBackground()

        // ver si hay tarjetas disponibles
        self.tableview.frame.size.height = 276
        
        self.cardsScrollView.contentSize = CGSize(width: 320*3, height: 60)

    }

    @IBAction func payTicket(_ sender: Any) {
        let vcpushed = CreditCardDetailViewController()
        vcpushed.parentViewName = "ticket"
        self.navigationController?.pushViewController(vcpushed, animated: true)
        
    }
    
    @IBAction func back(_ sender: Any) {
        print("volver");
    }
    
}

// MARK: - UITableViewDelegate
extension PayTicketViewController: UITableViewDelegate , UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 38
    }
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        //let cell = tableView.cellForRowAtIndexPath(indexPath)
        // cell?.textLabel?.textColor = UIColor.blackColor()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        let identifier = "Cell"
        
        let cell: TicketTableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? TicketTableViewCell

        cell.nameLabel.text =  "testt"
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // let cell = tableView.dequeueReusableCell(withIdentifier: "PMQuestionCellViewIdentifier", for: indexPath) as! QuestionsTableViewCell
        //cell.nameLabel.text = "test" //self.questionList[indexPath.row]
        
        
        let identifier = "Cell"
        
        var cell: TicketTableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? TicketTableViewCell
        
        if cell == nil {
            tableView.register(UINib(nibName: "TicketTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? TicketTableViewCell
        }
        cell.nameLabel.text =  self.dataArray[indexPath.row][0]
        
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? // custom view for footer. will be adjusted to default or specified footer height
    {
        let total = "s/ 358.70"
        
        let attStr1 = NSMutableAttributedString().characterSubscriptAndSuperscript(
            string: total,
            characters:["7","7"],
            type: .aSuper,
            fontSize: 27,
            scriptFontSize: 15,
            offSet: 10,
            length: [1,2],
            alignment: .right)
        
        ticketFooterView?.totalLabel.attributedText = attStr1
        ticketFooterView?.totalLabel.textColor = UIColor(hexColor: "#0083ff")
        return ticketFooterView
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? // custom view for header. will be adjusted to default or specified header height
    {
        return ticketHeaderView
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 50
    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    {
        return 123
    }
}
