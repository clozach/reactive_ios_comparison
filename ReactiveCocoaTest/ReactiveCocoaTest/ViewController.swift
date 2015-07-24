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

  func dubble(string: AnyObject!) -> AnyObject! {
    if let str = string as? String, let i = str.toInt() {
      return i * 2
    }
    return 0
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    textField.rac_textSignal()
      .throttle(1.0)
      .map(dubble)
      .subscribeNextAs {
      (i: Int) in
      self.label.text = "\(i)"
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}

