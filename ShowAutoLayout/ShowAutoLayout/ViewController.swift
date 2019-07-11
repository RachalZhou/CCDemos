//
//  ViewController.swift
//  ShowAutoLayout
//
//  Created by 周日朝 on 2019/7/5.
//  Copyright © 2019 ZRC. All rights reserved.
//  仿照戴铭“ShowAutoLayout”用Swift写的Demo

import UIKit
import SnapKit

let margin: Float = 10
let nameString = "周日朝"
let websiteString = "https://github.com/RachalZhou"
let subLeftString = "从事iOS开发工作"
let subRightString = "热爱编程，不断学习，点滴积累"

class ViewController: UIViewController {

    //MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.lightGray
        self.view.addSubview(self.contentView)
        self.view.addSubview(self.avatarImageView)
        self.view.addSubview(self.nameLabel)
        self.view.addSubview(self.describeLabel)
        self.view.addSubview(self.iconImageView)
        self.view.addSubview(self.adjustSlider)
        
        self.view.addSubview(self.subHelperView)
        self.subHelperView.addSubview(self.subLeftLabel)
        self.subHelperView.addSubview(self.subSeparateView)
        self.subHelperView.addSubview(self.subRightLazbel)
        
        self.contentView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(60)
            make.left.equalTo(self.view).offset(margin)
            make.right.equalTo(self.view).offset(-margin)
            make.height.equalTo(90)
        }
        self.avatarImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView).offset(margin)
            make.left.equalTo(self.contentView).offset(margin)
            make.size.equalTo(CGSize.init(width: 35, height: 35))
        }
        self.nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView).offset(margin)
            make.left.equalTo(self.avatarImageView.snp.right).offset(margin)
        }
        self.describeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView).offset(margin)
            make.left.equalTo(self.nameLabel.snp.right).offset(margin)
        }
        self.iconImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView).offset(margin)
            make.left.equalTo(self.describeLabel.snp.right).offset(margin)
            make.size.equalTo(CGSize.init(width: 30, height: 20))
            make.right.lessThanOrEqualTo(self.contentView).offset(-margin)
        }
        self.adjustSlider.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView.snp.bottom).offset(margin)
            make.left.equalTo(self.view).offset(margin)
            make.right.equalTo(self.view).offset(-margin)
        }
        
        self.subHelperView.snp.makeConstraints { (make) in
            make.top.equalTo(self.nameLabel.snp.bottom).offset(margin)
            make.left.equalTo(self.nameLabel)
            make.right.equalTo(self.contentView).offset(-margin)
        }
        self.subLeftLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.subHelperView)
            make.left.equalTo(self.subHelperView)
            make.width.greaterThanOrEqualTo(100)
        }
        self.subSeparateView.snp.makeConstraints { (make) in
            make.top.equalTo(self.subLeftLabel).offset(6)
            make.left.equalTo(self.subLeftLabel.snp.right).offset(margin)
            make.size.equalTo(CGSize.init(width: 15, height: 1))
        }
        self.subRightLazbel.snp.makeConstraints { (make) in
            make.top.equalTo(self.subLeftLabel)
            make.left.equalTo(self.subSeparateView.snp.right).offset(margin)
            make.width.greaterThanOrEqualTo(100)
            make.right.lessThanOrEqualTo(self.subHelperView).offset(-margin)
        }
    }
    
    //MARK: private
    @objc func updateAdjustSliderValue(sender: UISlider) {
        
        let f: Float = sender.value
        self.contentView.snp.updateConstraints { (make) in
            make.left.equalTo(self.view).offset(f)
        }
    }
    
    //MARK: getter
    lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = UIColor.white
        contentView.layer.cornerRadius = 4
        contentView.layer.shadowOffset = CGSize.init(width: 0, height: 0.5)
        contentView.layer.shadowColor = UIColor.init(white: 0.000, alpha: 100).cgColor
        contentView.layer.shadowOpacity = 0.4
        contentView.layer.shadowRadius = 4
        return contentView
    }()
    
    lazy var avatarImageView: UIImageView = {
        let avatarImageView = UIImageView.init(image: UIImage.init(named: "avatar"))
        avatarImageView.contentMode = UIView.ContentMode.scaleAspectFit
        avatarImageView.layer.cornerRadius = 35/2
        avatarImageView.layer.masksToBounds = true
        return avatarImageView
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = nameString
        nameLabel.textColor = UIColor.orange
        nameLabel.font = UIFont.systemFont(ofSize: 14.0)
        nameLabel.setContentCompressionResistancePriority(UILayoutPriority.required, for: NSLayoutConstraint.Axis.horizontal)
        return nameLabel
    }()
    
    lazy var describeLabel: UILabel = {
        let describeLebel = UILabel()
        describeLebel.text = websiteString
        describeLebel.font = UIFont.systemFont(ofSize: 14.0)
        describeLebel.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: NSLayoutConstraint.Axis.horizontal)
        return describeLebel
    }()
    
    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView.init(image: UIImage.init(named: "star"))
        iconImageView.contentMode = UIView.ContentMode.scaleAspectFit
        return iconImageView
    }()
    
    lazy var subHelperView: UIView = {
        let subHelperView = UIView()
        return subHelperView
    }()
    
    lazy var subLeftLabel: UILabel = {
        let subLeftLabel = UILabel()
        subLeftLabel.text = subLeftString
        subLeftLabel.textColor = UIColor.gray
        subLeftLabel.font = UIFont.systemFont(ofSize: 14.0)
        subLeftLabel.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: NSLayoutConstraint.Axis.horizontal)
        return subLeftLabel
    }()
    
    lazy var subSeparateView: UIView = {
        let subSeparateView = UIView()
        subSeparateView.backgroundColor = UIColor.gray
        subSeparateView .setContentCompressionResistancePriority(UILayoutPriority.required, for: NSLayoutConstraint.Axis.horizontal)
        return subSeparateView
    }()
    
    lazy var subRightLazbel: UILabel = {
        let subRightLazbel = UILabel()
        subRightLazbel.text = subRightString
        subRightLazbel.textColor = UIColor.gray
        subRightLazbel.font = UIFont.systemFont(ofSize: 14.0)
        subRightLazbel.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: NSLayoutConstraint.Axis.horizontal)
        return subRightLazbel
    }()
    
    lazy var adjustSlider: UISlider = {
        let adjustSlider = UISlider()
        adjustSlider.minimumValue = margin
        adjustSlider.maximumValue = 200
        adjustSlider.minimumTrackTintColor = UIColor.lightGray
        adjustSlider.addTarget(self, action: #selector(updateAdjustSliderValue(sender:)), for: UIControl.Event.valueChanged)
        return adjustSlider
    }()
}

