//
//  ViewController.swift
//  NZSwiftExtension
//
//  Created by lv on 2019/10/12.
//  Copyright © 2019 lvfumei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.white
    
        let lab = UILabel.init(frame: CGRect.init(x: 50, y: 100, width: 200, height: 50.0))
        lab.text = "UILabel增加下划线"
        lab.nz_underline()
        self.view.addSubview(lab)
        
        
        print("123456".nz_md5())
        
        
        
    }


}

