//
//  ListTableViewCell.swift
//  ListApp
//
//  Created by Satya on 06/11/20.
//  Copyright © 2020 Satya. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    var imgView: UIImageView!
    var lblTitile: UILabel!
    var lblDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    
    func configureUI() {
        self.selectionStyle  = .none
        configureImageUI()
        configureTitleLabelUI()
        configureDescriptionLabelUI()
        
        
    }
    
    func configureImageUI() {
        imgView = UIImageView()
        imgView.backgroundColor = UIColor.red
        self.contentView.addSubview(imgView)
        
        //configure autolayouts for imageview
        imgView.translatesAutoresizingMaskIntoConstraints = false
        let constraintCenterX = imgView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        contentView.addConstraint(constraintCenterX)
        NSLayoutConstraint(item: imgView, attribute: .width, relatedBy: .equal, toItem: imgView, attribute: .height, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: imgView, attribute: .width, relatedBy: .lessThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 150).isActive = true
        
        let constraintMaxWidth = NSLayoutConstraint(item: imgView, attribute: .width, relatedBy: .equal, toItem: contentView, attribute: .width, multiplier: 100 / 320, constant: 0)
        constraintMaxWidth.priority = UILayoutPriority(rawValue: 900)
        constraintMaxWidth.isActive = true
        NSLayoutConstraint(item: self.contentView, attribute: .bottom, relatedBy: .greaterThanOrEqual, toItem: self.imgView, attribute: .bottom, multiplier: 1.0, constant: 15).isActive = true
         NSLayoutConstraint(item: imgView, attribute: .top, relatedBy: .greaterThanOrEqual, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: 15).isActive = true
        NSLayoutConstraint(item: imgView, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1.0, constant: 15).isActive = true
        
        
    }
    
    func configureTitleLabelUI() {
        
        lblTitile = UILabel()
        lblTitile.numberOfLines = 0
        lblTitile.textAlignment = .left
        self.contentView.addSubview(lblTitile)
        lblTitile.textColor = UIColor.black
        lblTitile.font = UIFont.systemFont(ofSize: FONT_SIZE_TITLE_LABEL)
        
        //configure autolayouts for TitleLabel
        lblTitile.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: lblTitile, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: 15).isActive = true
        NSLayoutConstraint(item: lblTitile!, attribute: .leading, relatedBy: .equal, toItem: self.imgView, attribute: .trailing, multiplier: 1.0, constant: 15).isActive = true
        NSLayoutConstraint(item: lblTitile, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1.0, constant: -15).isActive = true
        
    }
    
    func configureDescriptionLabelUI() {
        
        lblDescription = UILabel()
        lblDescription.textColor = UIColor.black
        lblDescription.font = UIFont.systemFont(ofSize:FONT_SIZE_DESCRIPTION_LABEL)
        lblDescription.numberOfLines = 0
        lblDescription.textAlignment = .left
        self.contentView.addSubview(lblDescription)
        
        //configure autolayouts for DescriptionLabel
        lblDescription.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: lblDescription, attribute: .top, relatedBy: .equal, toItem: self.lblTitile, attribute: .bottom, multiplier: 1.0, constant: 5).isActive = true
        NSLayoutConstraint(item: lblDescription!, attribute: .leading, relatedBy: .equal, toItem: self.imgView, attribute: .trailing, multiplier: 1.0, constant: 15).isActive = true
        NSLayoutConstraint(item: lblDescription, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1.0, constant: -15).isActive = true
        NSLayoutConstraint(item: self.contentView, attribute: .bottom, relatedBy: .greaterThanOrEqual, toItem: self.lblDescription, attribute: .bottom, multiplier: 1.0, constant: 10).isActive = true

        
    }
    
    func configureData(_ indexPath: IndexPath) {
        self.lblTitile.text = "Title"
        self.lblDescription.text = "Description"
        if indexPath.row % 3 == 0 {
            self.lblTitile.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        }
        if indexPath.row % 5 == 0 {
            self.lblDescription.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        }
        
        if indexPath.row % 7 == 0 {
            self.lblTitile.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
                   self.lblDescription.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
               }
    }

}
