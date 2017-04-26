//
//  PMTabBarController.swift
//  payme
//
//  Created by Franco Paredes on 26/04/17.
//  Copyright © 2017 Alignet. All rights reserved.
//

import Foundation
import UIKit

class PMTabBarController: UITabBarController {
    
    let controlerIniTab1 = UIStoryboard.flowAgregarServicio() // VivoVC(nibName: "VivoVC", bundle: nil)
    let controlerIniTab2 = UIViewController()// VodVC(nibName: "VodVC", bundle: nil)
    let controlerIniTab3 = UIViewController()// NpvrVC(nibName: "NpvrVC", bundle: nil)
    let controlerIniTab4 = UIViewController()// NpvrVC(nibName: "NpvrVC", bundle: nil)
    let controlerIniTab5 = UIViewController()// NpvrVC(nibName: "NpvrVC", bundle: nil)
    
    
    let imageInset = UIEdgeInsetsMake(-6, 0, 6, 0)  //  top: , _ left: , _ bottom: , _ right: )
    
    // MENU 1
    let tabIco1_off = UIImage(named: "tab_favoritos_inactivo")?.withRenderingMode(.alwaysOriginal)
    let tabIco1_on = UIImage(named: "tab_favoritos_activo")?.withRenderingMode(.alwaysOriginal)
    // MENU 2
    let tabIco2_off = UIImage(named: "tab_servicios_inactivo")?.withRenderingMode(.alwaysOriginal)
    let tabIco2_on = UIImage(named: "tab_servicios_activo")?.withRenderingMode(.alwaysOriginal)
    // MENU 3
    let tabIco3_off = UIImage(named: "tab_pay_me_inactivo")?.withRenderingMode(.alwaysOriginal)
    let tabIco3_on = UIImage(named: "tab_pay_me_activo")?.withRenderingMode(.alwaysOriginal)
    // MENU 4
    let tabIco4_off = UIImage(named: "tab_agenda_inactivo")?.withRenderingMode(.alwaysOriginal)
    let tabIco4_on = UIImage(named: "tab_agenda_activo")?.withRenderingMode(.alwaysOriginal)
    // MENU 5
    let tabIco5_off = UIImage(named: "tab_historico_inactivo")?.withRenderingMode(.alwaysOriginal)
    let tabIco5_on = UIImage(named: "tab_historico_activo")?.withRenderingMode(.alwaysOriginal)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ////////////////////     1     ///////////////////////
        let navVC1 = PMNavigationViewController()
        navVC1.navigationBar.barTintColor = UIColor(hexColor: "#0083ff")
        //navVC1.navigationBar.tintColor = UIColor.appBlueColor()

        navVC1.viewControllers = [controlerIniTab1]
        navVC1.tabBarItem = UITabBarItem(title: "Favoritos", image: tabIco1_off, selectedImage: tabIco1_on) //VIVO
        navVC1.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "SanFranciscoDisplay-Regular", size: 11)!], for: .normal)
        navVC1.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -1)
        ///UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -2)
        ////////////////////    2   /////////////////////////////////
        let navVC2 = PMNavigationViewController()
        navVC2.viewControllers = [controlerIniTab2]
        navVC2.tabBarItem = UITabBarItem(title: "Servicios", image: tabIco2_off, selectedImage: tabIco2_on)
        navVC2.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "SanFranciscoDisplay-Regular", size: 11)!], for: .normal)
        navVC2.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -1)
        ////////////////////   3   /////////////////////////////////
        let navVC3 = PMNavigationViewController()
        navVC3.viewControllers = [controlerIniTab3]
        navVC3.tabBarItem = UITabBarItem(title: "Pagos", image: tabIco3_off, selectedImage: tabIco3_on) //7 DIAS
        navVC3.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "SanFranciscoDisplay-Regular", size: 11)!], for: .normal)
        navVC3.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -1)
        navVC3.tabBarItem.imageInsets = imageInset
        ////////////////////   4   /////////////////////////////////
        let navVC4 = PMNavigationViewController()
        navVC4.viewControllers = [controlerIniTab4]
        navVC4.tabBarItem = UITabBarItem(title: "Agenda", image: tabIco4_off, selectedImage: tabIco4_on) //7 DIAS
        navVC4.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "SanFranciscoDisplay-Regular", size: 11)!], for: .normal)
        navVC4.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -1)
        ////////////////////   5   /////////////////////////////////
        let navVC5 = PMNavigationViewController()
        //navVC5.navigationBar.barTintColor = UIColor.black
        //navVC5.navigationBar.tintColor = UIColor.white
        navVC5.viewControllers = [controlerIniTab5]
        navVC5.tabBarItem = UITabBarItem(title: "Histórico", image: tabIco5_off, selectedImage: tabIco5_on) //7 DIAS
        navVC5.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "SanFranciscoDisplay-Regular", size: 11)!], for: .normal)
        navVC5.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -1)
        
        ///////////////////////////////////////////////////////////////////////////////////
        //conexicon al control principal,
        //Navigation bar appearance (background and title)
        self.viewControllers =  [navVC1,navVC2,navVC3,navVC4,navVC5,]
        self.selectedIndex = 0
        
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = false
        
        UITabBar.appearance().isTranslucent = false
        //  UITabBar.appearance().barTintColor = .blackColor()
        //  tabBarController.tabBar.barTintColor =   UIColor.black
        //  tabBarController.tabBar.tintColor = Glovar.get().appTintColor
    }
}
