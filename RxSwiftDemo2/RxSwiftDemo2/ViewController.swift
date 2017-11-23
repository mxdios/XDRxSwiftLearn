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
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        let disposeBag = DisposeBag()
        
        textField.rx.text.subscribe(onNext:{(str: String?) in
            print(str!)
        }).disposed(by: disposeBag)
        
//        button.rx.tap.subscribe(onNext: {
//            print("ddddddd")
//        }).disposed(by: disposeBag)
        
//        button.rx.tap.subscribe(onNext: {
//            [weak self] _ in self?.buttonClick()
//
//        }).disposed(by: disposeBag)
        
//        button.rx.tap.subscribe { (event : Event<()>) in
//            print("我是按钮我被点击了")
//            }.addDisposableTo(disposeBag)
    }

    @objc func buttonClick() {
        print("打印")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

