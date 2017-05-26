//
//  PMRecibosView.swift
//  Pay-me
//
//  Created by Cristian on 22/05/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit
import AlamofireImage
import RxSwift

class RecibosViewModel: NSObject {

    var identifier: String!
    var labelIdentifier: String!
    var url: URL!
    
    init(_ data: (Favorito, [Debt])) {
        
        guard let item = Session.shared.staticData.getItem(idCompanySPS: data.0.idCompanySPS) else {
            return
        }
        
        identifier = data.0.serviceIdentifier
        labelIdentifier = item.label.components(separatedBy: ",")[1]
        url = URL(string: item.logo_2!)
    }
}

class PMRecibosView: PMViewController {
    
    var vm: RecibosViewModel?
    
    @IBOutlet weak var lblIdentifier: UILabel!
    @IBOutlet weak var lblIdentifierTitle: UILabel!
    @IBOutlet weak var btnPagar: UIButton!
    @IBOutlet weak var imgBanner: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func initComponents() {
        super.initComponents()
        prepare()
        register()
        header()
        banner()
    }
    
    func prepare() {
        btnPagar.setGradientBackground()
        collectionView.layer.borderColor = UIColor.pmSilver.cgColor
        collectionView.layer.borderWidth = 0.5
    }
    
    func header() {
        lblIdentifier.text = vm?.identifier
        lblIdentifierTitle.text = vm?.labelIdentifier
    }
    
    func register() {
        let nib = UINib(nibName: "PMReciboCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "ReciboCell")
    }
    
    func banner() {
        imgBanner.af_setImage(withURL: vm!.url, placeholderImage: nil, imageTransition: .crossDissolve(0.2))
    }
    
    let insets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
}

//MARK: - UICollectionViewDataSource

extension PMRecibosView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReciboCell", for: indexPath)
        return cell
    }
}

//MARK: - UICollectionViewDelegate

extension PMRecibosView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension PMRecibosView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 310, height: 61)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return insets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return insets.left
    }
}
