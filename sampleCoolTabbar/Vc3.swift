//
//  Vc3.swift
//  sampleCoolTabbar
//
//  Created by Muneharu Onoue on 2016/11/09.
//  Copyright © 2016年 Muneharu Onoue. All rights reserved.
//

import UIKit

class Vc3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let lb = UILabel()
        lb.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 50)
        lb.center = CGPoint(x: view.bounds.size.width / 2, y: view.bounds.size.height / 2)
        lb.textAlignment = .center
        lb.font = UIFont.systemFont(ofSize: 30)
        lb.text = "VC3"
        lb.backgroundColor = UIColor.blue
        view.addSubview(lb)
        view.backgroundColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

