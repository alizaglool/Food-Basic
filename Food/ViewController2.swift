//
//  ViewController2.swift
//  Food
//
//  Created by A_Z on 9/11/19.
//  Copyright © 2019 A_Z. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    var SingleItem:FoodItem?
   
    @IBOutlet weak var laDes: UITextView!
    @IBOutlet weak var laName2: UILabel!
    @IBOutlet weak var laImage2: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        laName2.text = SingleItem?.Name!
        laDes.text = SingleItem?.Des!
        laImage2.image = UIImage(named: (SingleItem?.Iamge)!)!
        
    }
 
    @IBAction func buDismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
