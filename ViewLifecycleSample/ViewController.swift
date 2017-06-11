//
//  ViewController.swift
//  ViewLifecycleSample
//
//  Created by Shota Nakagami on 2017/06/11.
//  Copyright © 2017年 Shota Nakagami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    fileprivate var blueView = BlueView()
    fileprivate var blueViewLeadingConstraint = NSLayoutConstraint()
    fileprivate var redView = RedView()
    fileprivate var redViewWidthConstraint = NSLayoutConstraint()
    
    /// ビューの読み込み
    override func loadView() {
        print(NSStringFromClass(type(of:self)).components(separatedBy: ".")[1] + ":" + #function)

        // 管理対象のルートビュー生成し、viewプロパティに保持
        let rootView = WhiteView(frame: UIWindow().bounds)
        view = rootView
        
        // 赤いサブビューを白いビューに追加
        view.addSubview(redView)
        
        // 赤いサブビューのAutoResizingを無効にする
        redView.translatesAutoresizingMaskIntoConstraints = false
        
        // 赤いサブビューに制約を追加
        redView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        redView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        redViewWidthConstraint = redView.widthAnchor.constraint(equalToConstant: 200)
        redViewWidthConstraint.isActive = true
        redView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        // 青いサブビューを赤いビューに追加
        redView.addSubview(blueView)
        
        // 青いサブビューのAutoResizingを無効にする
        blueView.translatesAutoresizingMaskIntoConstraints = false
        
        // 青いサブビューに制約を追加
        blueView.topAnchor.constraint(equalTo: redView.topAnchor, constant: 50).isActive = true
        blueViewLeadingConstraint = blueView.leadingAnchor.constraint(equalTo: redView.leadingAnchor, constant: 50)
        blueViewLeadingConstraint.isActive = true
        blueView.trailingAnchor.constraint(equalTo: redView.trailingAnchor, constant: -50).isActive = true
        blueView.bottomAnchor.constraint(equalTo: redView.bottomAnchor, constant: -50).isActive = true
        
        // 更新用のボタンに制約を追加
        let updateButton = UIButton.init(type: UIButtonType.custom)
        view.addSubview(updateButton)
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        updateButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        updateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        updateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        updateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        updateButton.addTarget(self, action: #selector(updateButtonTapped), for: UIControlEvents.touchUpInside)
        
        // StoryBoardを用いない場合は、super.loadViewは実行しないほうがメモリ効率が良い
        // super.loadView()
    }
    
    /// ビューの読み込み完了
    override func viewDidLoad() {
        print(NSStringFromClass(type(of:self)).components(separatedBy: ".")[1] + ":" + #function)
        super.viewDidLoad()
    }
    
    /// ビューが表示される直前
    override func viewWillAppear(_ animated: Bool) {
        print(NSStringFromClass(type(of:self)).components(separatedBy: ".")[1] + ":" + #function)
        super.viewWillAppear(animated)
    }
    
    /// ビューの制約の更新
    override func updateViewConstraints() {
        print(NSStringFromClass(type(of:self)).components(separatedBy: ".")[1] + ":" + #function)
        super.updateViewConstraints()
    }
    
    /// ビューのレイアウトの開始直前
    override func viewWillLayoutSubviews() {
        print(NSStringFromClass(type(of:self)).components(separatedBy: ".")[1] + ":" + #function)
        super.viewWillLayoutSubviews()
    }
    
    /// ビューのレイアウト完了
    override func viewDidLayoutSubviews() {
        print(NSStringFromClass(type(of:self)).components(separatedBy: ".")[1] + ":" + #function)
        super.viewDidLayoutSubviews()
    }
    
    /// ビューの表示完了
    override func viewDidAppear(_ animated: Bool) {
        print(NSStringFromClass(type(of:self)).components(separatedBy: ".")[1] + ":" + #function)
        super.viewDidAppear(animated)
    }
    
    /// ビューの非表示直前
    override func viewWillDisappear(_ animated: Bool) {
        print(NSStringFromClass(type(of:self)).components(separatedBy: ".")[1] + ":" + #function)
        super.viewWillDisappear(animated)
    }
    
    /// ビューの非表示完了
    override func viewDidDisappear(_ animated: Bool) {
        print(NSStringFromClass(type(of:self)).components(separatedBy: ".")[1] + ":" + #function)
        super.viewDidDisappear(animated)
    }

    /// メモリ不足時
    override func didReceiveMemoryWarning() {
        print(NSStringFromClass(type(of:self)).components(separatedBy: ".")[1] + ":" + #function)
        super.didReceiveMemoryWarning()
    }

    /// 更新ボタンのタップ時
    @objc fileprivate func updateButtonTapped() {
        print(NSStringFromClass(type(of:self)).components(separatedBy: ".")[1] + ":" + #function)
        
        let actionSheet = UIAlertController(title: "更新方法",
                                            message: "",
                                            preferredStyle: UIAlertControllerStyle.actionSheet)
        actionSheet.addAction(UIAlertAction(title: "制約の更新のみ",
                                            style: UIAlertActionStyle.default) {
                                                [weak self] (action: UIAlertAction) in
                                                guard let unwrappedSelf = self else {
                                                    return
                                                }
                                                unwrappedSelf.redViewWidthConstraint.constant = 300
                                                unwrappedSelf.blueViewLeadingConstraint.constant = 0
        })
        actionSheet.addAction(UIAlertAction(title: "setNeedsLayout",
                                            style: UIAlertActionStyle.default) {
                                                [weak self] (action: UIAlertAction) in
                                                guard let unwrappedSelf = self else {
                                                    return
                                                }
                                                unwrappedSelf.redViewWidthConstraint.constant = 300
                                                unwrappedSelf.blueViewLeadingConstraint.constant = 0
                                                unwrappedSelf.view.setNeedsLayout()
                                                
        })
        actionSheet.addAction(UIAlertAction(title: "layoutIfNeeded",
                                            style: UIAlertActionStyle.default) {
                                                [weak self] (action: UIAlertAction) in
                                                guard let unwrappedSelf = self else {
                                                    return
                                                }
                                                unwrappedSelf.redViewWidthConstraint.constant = 300
                                                unwrappedSelf.blueViewLeadingConstraint.constant = 0
                                                unwrappedSelf.view.setNeedsLayout()
                                                unwrappedSelf.view.layoutIfNeeded()
                                                
        })
        actionSheet.addAction(UIAlertAction(title: "layoutIfNeeded + setNeedsLayout",
                                            style: UIAlertActionStyle.default) {
                                                [weak self] (action: UIAlertAction) in
                                                guard let unwrappedSelf = self else {
                                                    return
                                                }
                                                unwrappedSelf.redViewWidthConstraint.constant = 300
                                                unwrappedSelf.blueViewLeadingConstraint.constant = 0
                                                unwrappedSelf.view.setNeedsLayout()
                                                unwrappedSelf.view.layoutIfNeeded()
                                                
        })
        self.present(actionSheet, animated: true, completion: nil)
    }
}

