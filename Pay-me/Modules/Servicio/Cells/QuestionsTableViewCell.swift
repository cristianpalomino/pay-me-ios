//
//  QuestionsTableViewCell.swift
//  payme
//
//  Created by Franco Paredes on 19/04/17.
//  Copyright © 2017 Alignet. All rights reserved.
//

import UIKit

class QuestionsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var checkImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
     //   if (selected) {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1, execute: { [weak self] in
               // self?.customLabel.textColor = UIColor.black
                self?.nameLabel.textColor = selected ? UIColor(hexColor:"#0083ff") : UIColor.black
                self?.checkImageView.image =  selected ? UIImage(named: "ico-check") : UIImage(named: "")
            })
      //  }
    }


}
