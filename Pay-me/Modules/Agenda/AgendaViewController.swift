//
//  AgendaViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 11/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import FSCalendar
import UIKit

class AgendaViewController: PMViewController, UIGestureRecognizerDelegate {
    
    var pagos = [Pay(name: "Unviersidad Karolina", entidad: "UPC", identifier: "WLAN 92132", type: .SUCCESS),
                 Pay(name: "Celular Personal", entidad: "Entel", identifier: "932 366 740", type: .DENIED),
                 Pay(name: "Luz Casa", entidad: "Luz del Sur", identifier: "F9 19 129", type: .DENIED),
                 Pay(name: "Restaurante Anticucho", entidad: "Restaurante", identifier: "Exclusivo", type: .SUCCESS),
                 Pay(name: "Unviersidad Karolina", entidad: "UPC", identifier: "WLAN 92132", type: .SUCCESS),
                 Pay(name: "Celular Personal", entidad: "Entel", identifier: "932 366 740", type: .DENIED),
                 Pay(name: "Luz Casa", entidad: "Luz del Sur", identifier: "F9 19 129", type: .DENIED),
                 Pay(name: "Restaurante Anticucho", entidad: "Restaurante", identifier: "Exclusivo", type: .SUCCESS)]
    
    @IBOutlet weak var calendarHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var tableview: UITableView!

    fileprivate lazy var scopeGesture: UIPanGestureRecognizer = {
        [unowned self] in
        let panGesture = UIPanGestureRecognizer(target: self.calendar, action: #selector(self.calendar.handleScopeGesture(_:)))
        panGesture.delegate = self
        panGesture.minimumNumberOfTouches = 1
        panGesture.maximumNumberOfTouches = 2
        return panGesture
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension AgendaViewController {
    
    override func initComponents() {
        self.view.addGestureRecognizer(self.scopeGesture)
        self.tableview.panGestureRecognizer.require(toFail: self.scopeGesture)

        self.tableview.layer.borderColor = UIColor.appGrayColor().cgColor
        self.tableview.layer.borderWidth = 0.5
        
        calendar.appearance.headerTitleColor = UIColor.appDarkGrayAgendaColor()
        calendar.appearance.caseOptions = [.headerUsesUpperCase]
        calendar.appearance.titleFont = UIFont(name: "San Francisco Display Regular", size: 15)
        calendar.appearance.weekdayTextColor = UIColor.red
        calendar.calendarHeaderView.backgroundColor = UIColor.appGrayAgendaColor()
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let shouldBegin = self.tableview.contentOffset.y <= -self.tableview.contentInset.top
        if shouldBegin {
            let velocity = self.scopeGesture.velocity(in: self.view)
            switch self.calendar.scope {
            case .month:
                return velocity.y < 0
            case .week:
                return velocity.y > 0
            }
        }
        return shouldBegin
    }
}

extension AgendaViewController : FSCalendarDelegate {
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        self.calendarHeightConstraint.constant = bounds.height
        self.view.layoutIfNeeded()
    }
}

extension AgendaViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "kDetalleRecibo", sender: nil)
    }
}

extension AgendaViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pagos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AgendaTableViewCell.identifier, for: indexPath) as! AgendaTableViewCell
        cell.item = pagos[indexPath.row]
        return cell
    }
}
