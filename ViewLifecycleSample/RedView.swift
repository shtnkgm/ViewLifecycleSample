//
//  RedView.swift
//  ViewLifecycleSample
//
//  Created by Shota Nakagami on 2017/06/11.
//  Copyright © 2017年 Shota Nakagami. All rights reserved.
//

import UIKit

class RedView: UIView {
    fileprivate let color = UIColor.init(red: 231/255, green: 76/255, blue: 60/255, alpha: 1.0)
    
    // プロパティの初期化
    fileprivate func configure() {
        backgroundColor = color
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    /// イニシャライザ
    init() {
        print(NSStringFromClass(type(of:self)).components(separatedBy: ".")[1] + ":" + #function)
        super.init(frame: CGRect.zero)
        configure()
    }
    
    /// イニシャライザ
    override init(frame: CGRect) {
        print(NSStringFromClass(type(of:self)).components(separatedBy: ".")[1] + ":" + #function)
        super.init(frame: frame)
        configure()
    }
    
    /// イニシャライザ（StoryBoardやIntefaceBuilderでの生成）
    required init?(coder aDecoder: NSCoder) {
        print(NSStringFromClass(type(of:self)).components(separatedBy: ".")[1] + ":" + #function)
        super.init(coder: aDecoder)
        configure()
    }
    
    /// 制約の更新
    override func updateConstraints() {
        print(NSStringFromClass(type(of:self)).components(separatedBy: ".")[1] + ":" + #function)
        super.updateConstraints()
    }
    
    /// 制約の更新要否のフラグを立てる
    override func setNeedsUpdateConstraints() {
        print(NSStringFromClass(type(of:self)).components(separatedBy: ".")[1] + ":" + #function)
        super.setNeedsUpdateConstraints()
    }
    
    /// 必要に応じて制約の更新を即時実行する
    override func updateConstraintsIfNeeded() {
        print(NSStringFromClass(type(of:self)).components(separatedBy: ".")[1] + ":" + #function)
        super.updateConstraintsIfNeeded()
    }
    
    /// レイアウトの更新
    override func layoutSubviews() {
        print(NSStringFromClass(type(of:self)).components(separatedBy: ".")[1] + ":" + #function)
        super.layoutSubviews()
    }
    
    /// レイアウトの更新要否のフラグを立てる
    override func setNeedsLayout() {
        print(NSStringFromClass(type(of:self)).components(separatedBy: ".")[1] + ":" + #function)
        super.setNeedsLayout()
    }
    
    /// 必要に応じてレイアウトの更新を即時実行する
    override func layoutIfNeeded() {
        print(NSStringFromClass(type(of:self)).components(separatedBy: ".")[1] + ":" + #function)
        super.layoutIfNeeded()
    }
    
    /// 描画の更新
    override func draw(_ rect: CGRect) {
        print(NSStringFromClass(type(of:self)).components(separatedBy: ".")[1] + ":" + #function)
        super.draw(rect)
    }
    
    /// 描画の更新要否のフラグを立てる
    override func setNeedsDisplay() {
        print(NSStringFromClass(type(of:self)).components(separatedBy: ".")[1] + ":" + #function)
        super.setNeedsDisplay()
    }
    
    /// 描画の更新要否のフラグを立てる
    override func setNeedsDisplay(_ rect: CGRect) {
        print(NSStringFromClass(type(of:self)).components(separatedBy: ".")[1] + ":" + #function)
        super.setNeedsDisplay(rect)
    }

}
