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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        let disposeBag = DisposeBag()
        
        button.rx.tap.subscribe(onNext: {
            print("ddddddd")
        }).disposed(by: disposeBag)
        
    }

    @objc func buttonClick() {
        print("打印")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

