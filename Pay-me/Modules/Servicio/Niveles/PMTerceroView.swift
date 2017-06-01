//
//  PMTerceroView.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 11/05/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMTerceroView: UIView {

    var touchDelegate: Touchable?
    
    @IBOutlet weak var titleStrip: PMTitleStrip!
    @IBOutlet weak var tableView: UITableView!
    
    var titles: [(title: String,color: UIColor)] {
        return [("Publicas",color: UIColor.appBlueColor()),
                ("Privadas",color: UIColor.appBlueColor())]
    }
    
    var items: [Item]? {
        didSet {
            reloadTableView()
        }
    }
    
    func initUI() {
        items = Session.shared.current.categoria?.items
        registerCell()
        titleStrip.titles = titles
    }
    
    class func instanceFromNib() -> PMTerceroView {
        return UINib(nibName: "TerceroView",
                     bundle: nil).instantiate(withOwner:
                        nil, options: nil).first as! PMTerceroView
    }
    
    func registerCell() {
        let nib = UINib(nibName: "EntidadTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: EntidadTableViewCell.identifier)
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
}

extension PMTerceroView : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items?[indexPath.row]
        Session.shared.current.item = item
        touchDelegate?.touch(params: nil)
    }
}

extension PMTerceroView : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items!.count
    }
    
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return Constants.Utils.ABECEDARIO
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EntidadTableViewCell.identifier,
                                                 for: indexPath) as! EntidadTableViewCell
        cell.servicio = items![indexPath.row]
        return cell
    }
}
