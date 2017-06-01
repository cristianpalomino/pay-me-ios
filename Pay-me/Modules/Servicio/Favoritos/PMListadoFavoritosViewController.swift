//
//  PMListadoFavoritosViewController.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 19/04/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class PMListadoFavoritosViewController: PMViewController {    
    
    let disposeBag = DisposeBag()
    var listadoView = PMListadoView.instanceFromNib()
    
    override var headerTitle: String {
        return "Mis Favoritos"
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bind()
    }
    
    override func didReceiveMemoryWarning() {
        didReceiveMemoryWarning()
    }

    override func initComponents() {        
        super.initComponents()
        prepare()
    }
    
    func prepare() {
        listadoView.initUI()
        add(mainView: listadoView)
    }
    
    func bind() {
    
        PaymeService.getFavoritos().subscribe( onNext: { favoritos in
            self.listadoView.favoritos = favoritos
            self.listadoView.reloadTableView()
        }, onError: { error in
            print(error.localizedDescription)
        }, onCompleted: {
            print("onCompleted - getServices")
        }).addDisposableTo(disposeBag)
        
        listadoView.onTouchAdd = {
            self.toSegue(identifier: "toPrimero")
        }
        
        listadoView.onTouchPay = { favorito in
            
            PaymeService.getReceipts(favorito: favorito).subscribe( onNext: { tuple in
                let recibosView = PMRecibosView()
                recibosView.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(recibosView, animated: true)
            }, onError: { error in
                print(error.localizedDescription)
            }, onCompleted: {
                print("onCompleted - getRecibos")
            }).addDisposableTo(self.disposeBag)
        }
    }
}
