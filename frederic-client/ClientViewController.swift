//
//  ClientViewController.swift
//  frederic-client
//
//  Created by Jim Hopp on 12/22/16.
//  Copyright © 2016 Jim Hopp. All rights reserved.
//

import UIKit

class ClientViewController: UIViewController {
    @IBOutlet weak var nameField : UITextField!
    var clientName : String
    
    init(_ clientName : String) {
        self.clientName = clientName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = self.clientName
        self.nameField.text = self.clientName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
