//
//  TableViewCell.swift
//  ViewTheme
//
//  Created by IPS-177  on 26/02/24.
//

import UIKit

class TableViewCell: UITableViewCell {

    var colorBtnPressedClosure : (()->())?
    @IBOutlet weak var celllbl: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    @IBAction func btnActionColor(_ sender: Any) {
        colorBtnPressedClosure?()
        
    }
    
    
    @IBOutlet weak var btnColorchange: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }
    func configure(color:UIColor){
        let colorName = getColorName(for: color)
        self.celllbl.textColor = color as! UIColor
        self.cellView.backgroundColor = color
      
    }
    
    func getColorName(for color: UIColor) -> String {
        switch color {
        case UIColor.appRed1:
            return "Red"
        case UIColor.appGreen1:
            return "Green"
        case UIColor.appBlue1:
            return "Blue"
        default:
            return "Unknown"
        }
    }

}
