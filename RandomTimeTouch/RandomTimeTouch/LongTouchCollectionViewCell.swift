//
//  LongTouchCollectionViewCell.swift
//  LongTouch2
//
//  Created by 김태우 on 2022/05/29.
//

import UIKit

class LongTouchCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var longTouchView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        longTouchView.clipsToBounds = true
        longTouchView.layer.cornerRadius = longTouchView.bounds.width / 2
    }
}
