//
//  ViewController.swift
//  InterstellarTest
//
//  Created by Hoverfly on 7/23/15.
//  Copyright (c) 2015 everyone. All rights reserved.
//

import UIKit
import ReactiveCocoa

class ViewController: UIViewController {

  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var label: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()

    textField.rac_textSignal().subscribeNextAs {
      (string: String) in
      self.label.text = string
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}

