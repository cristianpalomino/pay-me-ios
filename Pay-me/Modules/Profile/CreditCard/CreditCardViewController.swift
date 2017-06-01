//
//  CreditCardViewController.swift
//  payme
//
//  Created by Franco Paredes on 27/04/17.
//  Copyright © 2017 Alignet. All rights reserved.
//

import UIKit

public var listData:Array = ["test","test2"]

class CreditCardViewController: PMViewController
    , UITableViewDelegate
    , UITableViewDataSource
{

    @IBOutlet weak var cardlistTableview: UITableView!
    @IBOutlet weak var addCardView: UIView!
    @IBOutlet weak var addCardButton: UIButton!
    @IBOutlet weak var messageView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        listData.removeAll()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
         initView()
    }
    
    func initView() -> Void
    {
        if(listData.count == 0)
        {
            self.cardlistTableview.isHidden = true
            self.addCardView.isHidden = false
        } else {
            self.cardlistTableview.isHidden = false
            self.addCardView.isHidden = true
            
            self.cardlistTableview.delegate = self
            self.cardlistTableview.reloadData()
        }
       
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func setUI() -> Void{
        addCardButton.setGradientBackground()
        
        if listData.count == 0
        {
            self.cardlistTableview.isHidden = true
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 65
    }
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        //let cell = tableView.cellForRowAtIndexPath(indexPath)
        // cell?.textLabel?.textColor = UIColor.blackColor()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let identifier = "Cell"
        
        let cell: CredicardTableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? CredicardTableViewCell
       
        // nameLabel.text = cell.nameLabel.text
        // activeAnswerView()
        // activeAnswerView()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let identifier = "Cell"
        
        var cell: CredicardTableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? CredicardTableViewCell
        
        if cell == nil {
            tableView.register(UINib(nibName: "CredicardTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? CredicardTableViewCell
        }
        
        cell.nameLabel.text =  listData[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        if indexPath.row == 0 {
//            return false
//        }
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete
        {
             listData.remove(at: indexPath.row)
            self.cardlistTableview.reloadData()
        }
        
       
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
//        label.text = "ADD"
//        label.textAlignment = .center
//        label.textColor = UIColor.white
        
        let img: UIImage = UIImage(named: "icono_eliminar")!
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 100, height: 100), false, UIScreen.main.scale)
            let context = UIGraphicsGetCurrentContext()
        
            // Set background color
            context!.setFillColor(UIColor.red.cgColor)
            context!.fill(CGRect(x: 0, y: 0, width: 100, height: 100))
        
            // Draw image
            img.draw(in: CGRect(x:24, y:22, width:21, height:21))
        
            // Draw View
           // label.layer.render(in: context!)
        
            // Retrieve new UIImage
            let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        let deleteRowAction = UITableViewRowAction(style: .normal, title: "        ") { (rowAction, indexPath) in
             print("borrar")
            self.deleteRow(indexPath: indexPath)
        }
         deleteRowAction.backgroundColor = UIColor(patternImage: newImage)
       
//        let delete = UITableViewRowAction(style: .normal, title: "Delete") { action, index in
//              print("delete")
//        }
//        let done = UITableViewRowAction(style: .default, title: "Done") { action, index in
//              print("done")
//        }
//        return [(delete as AnyObject) as! UITableViewRowAction, done]
        return  [deleteRowAction]
    }
    
    func deleteRow(indexPath: IndexPath)
    {
        listData.remove(at: indexPath.row)
        self.cardlistTableview.reloadData()
    }
    
    
    
    func confirmDelete(planet: String)
    {
        
        let alert = UIAlertController(title: "Delete Planet", message: "Are you sure you want to permanently delete \(planet)?", preferredStyle: .actionSheet)
        
        let DeleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: nil )//handleDeletePlanet
        let CancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil) //cancelDeletePlanet
        
        alert.addAction(DeleteAction)
        alert.addAction(CancelAction)
        
        // Support display in iPad
        alert.popoverPresentationController?.sourceView = self.view
        alert.popoverPresentationController?.sourceRect = CGRect(x:self.view.bounds.size.width / 2.0,
                                                                 y:self.view.bounds.size.height / 2.0,
                                                                 width: 1.0,
                                                                 height: 1.0)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func addCreditCard(_ sender: Any) {
         self.navigationController?.pushViewController(CreditCardDetailViewController(), animated: true)
    }
    
}
