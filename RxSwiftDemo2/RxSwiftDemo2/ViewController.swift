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
    @IBOutlet weak var textField: UITextField!
    
    private let disposeBag = DisposeBag()
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        button.rx.tap
            .subscribe(onNext: {
                print("点击")
            }).disposed(by: disposeBag)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

