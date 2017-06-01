//
//  CreatePinViewController.swift
//  payme
//
//  Created by Franco Paredes on 12/04/17.
//  Copyright © 2017 Alignet. All rights reserved.
//

import UIKit

class CreatePinViewController: PMViewController
{

    @IBOutlet weak var answerView: UIView!
    @IBOutlet weak var answerTextfield: UITextField!
    @IBOutlet weak var omitirButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var createpinreLabel: UILabel!
    @IBOutlet weak var createpinLabel: UILabel!
    @IBOutlet weak var descripcionView: UIView!
    
    @IBOutlet var questionsTableview: UITableView!
    
    @IBOutlet weak var questionsView: UIView!
    
    @IBOutlet weak var pinView: UIView!
    
    @IBOutlet weak var pinreView: UIView!
    
    @IBOutlet weak var createPinView: UIView!
    
    @IBOutlet var pindotButton: [UIButton]!
    
    @IBOutlet var pindotreButton: [UIButton]!
    
    @IBOutlet weak var pinTextfield: UITextField!
    
    @IBOutlet weak var pinreTextfield: UITextField!
    
    
    //  Esta variable **Mueve hacia arriba** el view que contiene el formulario.
    let posYUpPositionForm:Float = 38
    //  Esta variable **Mueve a la posicion normal** contenedor del formulario.
    let posYNormalPositionForm:Float = 100
    //  Op...
    
    var questionList: Array = ["¿Cuál es el nombre de tu abuela materna?"
        ,"¿Cómo se llama tu equipo favorito?"
        ,"¿Cuál es el nombre de tu primera mascota?"
        ,"¿Cuál es el nombre de tu primer colegio?"
        ,"¿Cuál es el curso que mas te gusta?"
        ,"¿Cómo se llamaba tu primer jefe?"
        ,"¿Cómo te llamaban en tu infancia?"
        ,"¿Cómo se llamaba el mejor amigo de tu adolescencia?"
        ,"¿Adónde fuiste la primera vez que viajaste en avión?"
        ,"¿Cuál es tu álbum musical favorito?"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        
        // Do any additional setup after loading the view.
        initView()
        setUI()
    }

  
    func setUI() -> Void {
        self.hideKeyboardWhenTappedAround()
        self.omitirButton.setGradientBackground()
        
    }
    
    func initView() -> Void
    {
        self.createPinView.addSubview(pinreView)
        self.pinreView.isHidden = true
        self.pinreView.frame = CGRect(x: -330, y: 120, width: self.createPinView.frame.size.width, height: 120)

        self.createPinView.addSubview(questionsView)
        self.questionsView.frame = CGRect(x: -330, y: 120, width: self.createPinView.frame.size.width, height: 500)
        self.questionsView.isHidden = true
        
        self.questionsTableview.delegate = self
        self.questionsTableview.reloadData()
        
        self.createPinView.addSubview(answerView)
        self.answerView.frame = CGRect(x: -330, y: 200, width: self.createPinView.frame.size.width, height: 200)
        self.answerView.isHidden = true
    }
    
    func desactivPinConfirm()
    {
        self.pinreView.isHidden = true
        self.pinreView.alpha = 0
        self.pinreView.frame.origin.x = -330
    }
    
    func activePinConfirm(string s: String) -> Void
    {
        
        self.pinreView.isHidden = false
        self.pinreView.alpha = 0
        
        UIView.animate(withDuration: 0.3,   delay: 0.0,
                       options: UIViewAnimationOptions.curveEaseInOut,
                       animations: { () -> Void in
                        
                        self.pinreView.alpha = 1
                        self.pinreView.frame = CGRect(x: 0
                                                    , y: 120
                                                    , width: self.createPinView.frame.size.width
                                                    , height: 120)

        }, completion: { (finished) -> Void in
        
        })
        
        movePins(positionY: posYUpPositionForm)
        
        if(s != "")
        {
            self.pinreTextfield.text = ""
            self.pinreTextfield.text = s //init string
        
            for inx in 0...3 {
                self.pindotreButton[inx].isSelected = false
            }
       
                self.pindotreButton[0].isSelected = true
            
            self.pinreTextfield.becomeFirstResponder()  
        }
        
        
        
    }

    
    @IBAction func activieQuestionAgain(_ sender: Any) {
        desativateAnswerView()
        activeQuestions()
    }
    
    
    func desactiveQuestion()
    {
        self.questionsView.alpha = 0
        self.questionsView.isHidden = true
        self.questionsTableview.isHidden = true
    }
    
    func activeQuestions() -> Void {
        
        //desactiveQuestion()
        desativateAnswerView()
        
        self.questionsView.isHidden = false
        self.dismissKeyboard()
        self.questionsTableview.isHidden = false
        self.questionsView.addSubview(self.questionsTableview)
        self.questionsTableview.frame = CGRect(x: 0, y: 75, width: 320, height: 225)
 
        UIView.animate(withDuration: 0.5,
                       delay: 0.2,
                       options: UIViewAnimationOptions.curveEaseInOut,
                       animations: { () -> Void in
                        
                        self.questionsView.frame.origin.y = 120
                        self.pinreView.alpha = 0
                        self.questionsView.alpha = 1.0
                        self.questionsView.frame = CGRect(x: 0, y: 120, width: self.createPinView.frame.size.width, height: 500)

                        
        }, completion: { (finished) -> Void in
            
            self.pinreView.isHidden  = true
            
        })
    }
    
    func desativateAnswerView() -> Void
    {
        self.dismissKeyboard()
        self.answerView.isHidden = true
        self.answerTextfield.text = ""
    }
    
    func activeAnswerView() -> Void{
        desativateAnswerView()
        self.questionsTableview.isHidden = true
        self.answerView.isHidden = false
        self.answerView.alpha = 0
        
        self.dismissKeyboard()
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       options: UIViewAnimationOptions.curveEaseInOut,
                       animations: { () -> Void in
                        
                        self.answerView.frame.origin.x = 0
                        self.answerView.alpha = 1.0
                        
        }, completion: { (finished) -> Void in
            
            self.pinreView.isHidden  = true
            
        })

        
    }
    
    func movePins(positionY val:Float) -> Void{
        
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       options: UIViewAnimationOptions.curveEaseInOut,
                       animations: { () -> Void in
                        
                       self.createPinView.frame.origin.y = CGFloat(val)
                        
        }, completion: { (finished) -> Void in   })
    }
    //This is for the keyboard to GO AWAYY !! when user clicks "Return" key  on the keyboard

  
    @IBAction func pincodeTap() {
        desactivPinConfirm()
        desactiveQuestion()
        desativateAnswerView()
         self.pinTextfield.becomeFirstResponder()
    }
    
    @IBAction func pincodere(_ sender: Any) {
        self.pinreTextfield.becomeFirstResponder()
    }
    

   
    //////////////////////////////////////////////////////////////////////
    
    @IBAction func registerUser(_ sender: Any) {
        
        self.navigationController?.pushViewController(CreatePinSuccessViewController(), animated: true)
        
    }
    
}

// MARK: - UITextFieldDelegate
extension CreatePinViewController:UITextFieldDelegate { // UITextFieldDelegate
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool // return NO to disallow editing.
    {
        //  print("escribir ")
        return true
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) // became first responder
    {
        print("init text")
    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
    {
        movePins(positionY: posYUpPositionForm)
        return true
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
    {
        
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool // called when clear button pressed. return NO to ignore (no notifications)
    {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        
        if textField  == answerTextfield
        {
          //  self.answerTextfield.resignFirstResponder()()
            self.dismissKeyboard()
        }
        
        return true
    }

    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool // return NO to not change text
    {
        
        let maxLength = 4
        
        if (textField == self.pinTextfield)
        {
            let currentStringPIN1: NSString = self.pinTextfield.text! as NSString
            let newStringPIN1: NSString = currentStringPIN1.replacingCharacters(in: range, with: string) as NSString
            let isCountPIN1Ok =  newStringPIN1.length <= maxLength
            
            if(isCountPIN1Ok){
                for inx in 0...3 {
                    self.pindotButton[inx].isSelected = false
                    self.pindotreButton[inx].isSelected = false // limpiar los datos de confirmar
                }
                
                for index in -1...newStringPIN1.length-1 {
                    //print("\(index) times ")
                    if(index >= 0){
                        self.pindotButton[index].isSelected = true
                    }
                }
                // si ya llego a 4
                if newStringPIN1.length == 4 {
                    self.createpinLabel.textColor  =  UIColor(hexColor: "#0083FF")
                    activePinConfirm(string: "")
                }else  {
                    self.createpinLabel.textColor  =  UIColor(hexColor: "#434A45")
                }
                return true
            } else { // mas de 4 elementos
                activePinConfirm(string: string)
                return false
            }
        }
        else if (textField == self.pinreTextfield)
        {
            let currentStringPIN2: NSString = self.pinreTextfield.text! as NSString
            let newStringPIN2: NSString = currentStringPIN2.replacingCharacters(in: range, with: string) as NSString
            let isCountPIN2Ok =  newStringPIN2.length <= maxLength
            
            if(isCountPIN2Ok){
                for inx in 0...3 {
                    self.pindotreButton[inx].isSelected = false
                }
                
                for index in -1...newStringPIN2.length-1 {
                    if(index >= 0){
                        self.pindotreButton[index].isSelected = true
                    }
                }
                
                // validando el match de lo que se escribe
                let pin1string = self.pinTextfield.text!  // "www.stackoverflow.com"
                let pin2string = self.pinreTextfield.text! + string
                
                let substring1 = pin1string.substringc(0..<newStringPIN2.length)
                
                let substring2 = pin2string.substringc(0..<newStringPIN2.length)
                
                if(substring1 == substring2)  {
                    self.createpinreLabel.textColor  =  UIColor(hexColor: "#434A45")
                }else  {
                    self.createpinreLabel.textColor  =  UIColor(hexColor: "#e9573f")
                }
                
                if newStringPIN2.length == 4 {
                    self.createpinreLabel.textColor  =  UIColor(hexColor: "#0083FF")
                    
                    activeQuestions()
                }
                return true
            }else
            {
                
                return false
            }
            
        }
         else if (textField == answerTextfield)
        {
            return true
        }
        return false
    }
    
       //////////////////////////////////////////////////////////////////////////////////////////
}

// MARK: - UITableViewDelegate UITableViewDataSource
extension CreatePinViewController: UITableViewDelegate, UITableViewDataSource { //
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 53
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        //let cell = tableView.cellForRowAtIndexPath(indexPath)
        // cell?.textLabel?.textColor = UIColor.blackColor()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let identifier = "Cell"
        let cell: QuestionsTableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? QuestionsTableViewCell
        questionLabel.text = cell.nameLabel.text
        activeAnswerView()
        activeAnswerView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "Cell"
        
        var cell: QuestionsTableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? QuestionsTableViewCell
        
        if cell == nil {
            tableView.register(UINib(nibName: "QuestionsTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? QuestionsTableViewCell
        }
        cell.nameLabel.text =  self.questionList[indexPath.row]
        
        
        return cell
        
    }
    
}
