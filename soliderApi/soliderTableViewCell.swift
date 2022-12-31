//
//  soliderTableViewCell.swift
//  soliderApi
//
//  Created by nschool on 02/11/22.
//

import UIKit

class soliderTableViewCell: UITableViewCell {
    @IBOutlet weak var iDLB: UILabel!
    
    @IBOutlet weak var NameLb: UILabel!
    
    @IBOutlet weak var pressLb: UILabel!
    
    @IBOutlet weak var managLb: UILabel!
    
    @IBOutlet weak var extlLb: UILabel!
    
    @IBOutlet weak var phonelLb: UILabel!
    
    @IBOutlet weak var websiteLb: UILabel!
    
    @IBOutlet weak var conCode: UILabel!
    
    @IBOutlet weak var cityCode: UILabel!
    
    @IBOutlet weak var conImg: UIImageView!
    
    
    @IBOutlet weak var socityImg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
