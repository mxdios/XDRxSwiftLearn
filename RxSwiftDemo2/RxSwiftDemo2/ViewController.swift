//
//  ViewController.swift
//  RxSwiftDemo2
//
//  Created by miaoxiaodong on 2017/11/23.
//  Copyright © 2017年 mark. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var pwdLabel: UILabel!
    
    @IBOutlet weak var loginBtn: UIButton!
    private let disposeBag = DisposeBag()
    
    var minusernamenum = 5
    var minpwdnum = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.rx.tap
            .scan(0){ (num, _) in
                return num + 1
            }
            .asDriver(onErrorJustReturn: 0)
            .map { allnum in
                return "点击  \(allnum)"
            }
            .drive(label.rx.text)
            .disposed(by: disposeBag)
        
        
        
        userNameLabel.text = "名字最低输入\(minusernamenum)字符"
        pwdLabel.text = "密码最低输入\(minpwdnum)字符"
        
         //用户名是否有效
        let usernameValid = userNameTextField.rx.text.orEmpty
            .map{ $0.count >= self.minusernamenum }
            .share(replay: 1)
        
        //密码是否有效
        let pwdValid = pwdTextField.rx.text.orEmpty
            .map{ $0.count >= self.minpwdnum}
            .share(replay: 1)
        
        //用户名密码同时有效
        let everythingValid = Observable.combineLatest(usernameValid, pwdValid) {$0 && $1}
            .share(replay: 1)
        
        //用户名是否有效 导致 密码输入框是否可输入
        usernameValid
            .bind(to: pwdTextField.rx.isEnabled)
            .disposed(by: disposeBag)
        
        //用户名是否有效 导致 用户名提醒文字是否隐藏
        usernameValid
            .bind(to: userNameLabel.rx.isHidden)
            .disposed(by: disposeBag)
        
        //密码是否有效  导致  密码提醒文字是否隐藏
        pwdValid
            .bind(to: pwdLabel.rx.isHidden)
            .disposed(by: disposeBag)
        
        //用户名密码同时有效 导致  按钮是否可点击
        everythingValid
            .bind(to: loginBtn.rx.isEnabled)
            .disposed(by: disposeBag)
        
        loginBtn.rx.tap
            .subscribe(onNext: {_ in
                print("登录")
            }).disposed(by: disposeBag)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

