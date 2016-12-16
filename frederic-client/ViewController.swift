//
//  ViewController.swift
//  frederic-client
//
//  Created by Jim Hopp on 12/16/16.
//  Copyright © 2016 Jim Hopp. All rights reserved.
//

import UIKit
extension CGRect {
    init(_ x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h:CGFloat) {
        self.init(x:x, y:y, width:w, height:h)
    }
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

