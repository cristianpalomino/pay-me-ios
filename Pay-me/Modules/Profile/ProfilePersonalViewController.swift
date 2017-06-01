//
//  ProfilePersonalViewController.swift
//  payme
//
//  Created by Franco Paredes on 28/04/17.
//  Copyright © 2017 Alignet. All rights reserved.
//

import UIKit
// import ZoomTransitioning


class ProfilePersonalViewController: PMViewController {
 
    
    @IBOutlet weak var pageControl: UIPageControl!

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var formView: UIView!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var lasnameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var addressTextfield: UITextField!
    @IBOutlet weak var nameImageView: UIImageView!
    @IBOutlet weak var lasnameCheckImageView: UIImageView!
    @IBOutlet weak var addressImageView: UIImageView!
    @IBOutlet weak var emailImageview: UIImageView!
   
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var photoImageView: UIView!
    
    @IBOutlet weak var generoTextfield: UITextField!
    @IBOutlet weak var generoImageview: UIImageView!
    
    @IBOutlet weak var typeDniTextfield: UITextField!
    
    @IBOutlet weak var typeDniImageview: UIImageView!
    
    
    @IBOutlet weak var dniImageview: UIImageView!
    @IBOutlet weak var dniTextfield: UITextField!
   
    @IBOutlet weak var dateBornImageview: UIImageView!
    @IBOutlet weak var dateBornTextfield: UITextField!
    
    @IBOutlet weak var form2View: UIView!
    
    @IBOutlet weak var scrollForm: UIScrollView!
    /// Esta variable **Mueve hacia arriba** el view que contiene el formulario.
    let posYUpPositionContent:Int = -54
    /// Esta variable **Mueve a la posicion normal** contenedor del formulario.
    let posYNormalPositionContent:Int = 96
    
    var genderPickerArray:Array = ["Seleccione","Masculino", "Femenino"]
    var typeDniPickerArray:Array = ["Seleccione","DNI", "Passport"]
    
    let genderPickerview = UIPickerView()
    let typeDniPickerview = UIPickerView()
    
    var comp = NSDateComponents()
    @IBOutlet weak var datePicker: UIDatePicker!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
        initUI()
    
    }
    
    func initUI()
    {
        // Load photo profile
        nextButton.isHidden = true;
        self.photoImageView.layer.cornerRadius = 41.0
        self.photoImageView.layer.borderColor = UIColor.white.cgColor
        self.photoImageView.layer.borderWidth = 0.0
        self.photoImageView.clipsToBounds = true
        
        // Edit UIImageview
        let singleTap = UITapGestureRecognizer(target: self, action: Selector("editPhotoProfile"))
    //    singleTap.numberOfTapsRequired = 1 // you can change this value
        self.photoImageView.isUserInteractionEnabled = true
        self.photoImageView.addGestureRecognizer(singleTap)
        showNextButton(isMove: true)
        
         
        self.scrollForm.contentSize = CGSize(width: 580, height: 192)
        
        genderPickerview.delegate = self
        generoTextfield.inputView =  genderPickerview
        
        typeDniPickerview.delegate = self
        typeDniTextfield.inputView =  typeDniPickerview
        
      //  datePicker.addTarget(self, action: Selector("datePickerChanged:"), for: UIControlEvents.valueChanged)

    }
    
   
    
    
    
    //Action
    func editPhotoProfile() {
        print("Imageview Clicked")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /**
     Este metodo se encarga de mover todo el diseno del formulario cada vez que se presiona un Textfield.
     
     - Parameter positionY: Posicion en INT que cambiar el Frame Y position del View
     */
    func showNextButton(isMove up:Bool)
    {
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       options: UIViewAnimationOptions.transitionCurlUp,
                       animations: { () -> Void in
                        if up {
                            self.nextButton.frame.origin.y = 455
                            self.nextButton.setGradientBackground()
                        }else   {
                            self.nextButton.frame.origin.y = 506 }
        }, completion: { (finished) -> Void in   })

    }
    func moveForm(positionY val:Int) -> Void{
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       options: UIViewAnimationOptions.transitionCurlUp,
                       animations: { () -> Void in
                        
                        self.contentView.frame.origin.y = CGFloat(val)
                        
        }, completion: { (finished) -> Void in   })
    }
    
    @IBAction func nextForm(_ sender: Any) {
        
    }
   
}



// MARK: - UIPickerViewDelegate
extension ProfilePersonalViewController:UIPickerViewDelegate{
    
    // MARK  --
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView == typeDniPickerview){
            return typeDniPickerArray.count
        }else {
            return genderPickerArray.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       
        if(pickerView == typeDniPickerview){
            return typeDniPickerArray[row]
        }else {
            return genderPickerArray[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView == typeDniPickerview){
            self.typeDniTextfield.text = typeDniPickerArray[row]
        }else{
            self.generoTextfield.text = genderPickerArray[row]
        }
    }
    
    // TODO:
    //    func transitionSourceImageView() -> UIImageView {
    //        return self.photoImageView as! UIImageView
    //    }
    //
    //    func transitionSourceImageViewFrame(forward: Bool) -> CGRect {
    //        return self.photoImageView.convert(self.photoImageView.bounds, to: view)
    //    }
    //
    //    func transitionSourceWillBegin() {
    //        self.photoImageView.isHidden = true
    //    }
    //
    //    func transitionSourceDidEnd() {
    //        self.photoImageView.isHidden = false
    //    }
    //
    //    func transitionSourceDidCancel() {
    //        self.photoImageView.isHidden = false
    //    }
    
    
    @IBAction func dateFieldEditing(_ sender: Any) {
        
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.date
        
        
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        calendar.timeZone = NSTimeZone(name: "UTC")! as TimeZone
        
        let components: NSDateComponents = NSDateComponents()
        components.calendar = calendar as Calendar
        components.month = -0 // this is for month
        components.year = -80
        let minDate: NSDate = calendar.date(byAdding: components as DateComponents
            , to: NSDate() as Date
            , options: NSCalendar.Options(rawValue: 0))! as NSDate
        
        
        datePickerView.minimumDate = minDate as Date
        datePickerView.maximumDate = Date()
        
        self.dateBornTextfield.inputView = datePickerView
        
        datePickerView.addTarget(self, action: #selector(self.datePickerValueChanged), for: UIControlEvents.valueChanged)
        
    }
    
    // 7
    func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.medium
        
        dateFormatter.timeStyle = DateFormatter.Style.none
        
        self.dateBornTextfield.text = dateFormatter.string(from: sender.date)
        
    }
    
}


// MARK: - UITextFieldDelegate
extension ProfilePersonalViewController:UITextFieldDelegate
{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
        print("ShouldBeginEditing")
        return true
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("DidBeginEditing")
        moveForm(positionY: posYUpPositionContent)
    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        moveForm(positionY: posYNormalPositionContent)
        
        if textField == emailTextfield  {
            if textField.text != "" {
                if (Util().validateEmail(enteredEmail: textField.text!)) {
                    self.emailImageview.isHighlighted = true
                    self.emailTextfield.textColor = UIColor(hexColor: "#434A54")
                }else {
                    self.emailImageview.isHighlighted = false
                    self.emailTextfield.textColor = UIColor(hexColor: "#da4453")
                }
            }
            else { self.emailImageview.isHighlighted = false }
        }else if textField == addressTextfield
        {
            if textField.text != "" {
                self.addressImageView.isHighlighted = true
            }
            else { self.addressImageView.isHighlighted = false }
        }
        
        return true
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField)  {
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool   {
        if textField  == nameTextfield   {
            self.lasnameTextfield.becomeFirstResponder()
        }else if textField == lasnameTextfield   {
            self.emailTextfield.becomeFirstResponder()
        } else if textField == emailTextfield   {
            self.addressTextfield.becomeFirstResponder()
        }else if textField == addressTextfield    {
            self.addressTextfield.resignFirstResponder()
            moveForm(positionY: posYNormalPositionContent)
        }
        
        //  registerUser
        // validar  y mostrar boton de siguiente
        if(self.nameImageView.isHighlighted &&
            self.lasnameCheckImageView.isHighlighted &&
            self.emailImageview.isHighlighted &&
            self.addressImageView.isHighlighted)  {
            showNextButton(isMove:  true)
        } else {
            showNextButton(isMove: false)
            
        }
        return true
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        // Test the offset and calculate the current page after scrolling ends
        let pageWidth:CGFloat = scrollView.frame.width
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        // Change the indicator
        self.pageControl.currentPage = Int(currentPage);
    }
    
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        let maxLengthName =  20
        let minLengthName =  2
        
        if textField  == nameTextfield {
            
            let currentStringPIN1: NSString = self.nameTextfield.text! as NSString
            let newStringPIN1: NSString = currentStringPIN1.replacingCharacters(in: range, with: string) as NSString
            
            if(newStringPIN1.length <= maxLengthName) {
                
                if newStringPIN1.length <= minLengthName {
                    self.nameTextfield.textColor = UIColor(hexColor: "#dE4453")
                    self.nameImageView.isHighlighted = false
                }else
                {
                    self.nameImageView.isHighlighted = true
                    self.nameTextfield.textColor = UIColor(hexColor: "#434A54")
                }
                return true
            } else { // mas de 4 elementos
                // self.nameImageView.isHighlighted = false
                //   self.nameTextfield.textColor = UIColor(hexColor: "#dE4453")
                return false
            }
        }else   if  textField  == lasnameTextfield   {
            
            let currentStringPIN1: NSString = self.lasnameTextfield.text! as NSString
            let newStringPIN1: NSString = currentStringPIN1.replacingCharacters(in: range, with: string) as NSString
            
            if(newStringPIN1.length <= maxLengthName) {
                
                if newStringPIN1.length <= minLengthName {
                    self.lasnameCheckImageView.isHighlighted = false
                    self.lasnameTextfield.textColor = UIColor(hexColor: "#dE4453")
                }else
                {
                    self.lasnameCheckImageView.isHighlighted = true
                    self.lasnameTextfield.textColor = UIColor(hexColor: "#434A54")
                }
                return true
                
            } else { // mas de 4 elementos
                //self.lasnameCheckImageView.isHighlighted = false
                // self.lasnameTextfield.textColor = UIColor(hexColor: "#dE4453")
                return false
            }
            
        }
 
        
        return true
    }
}

