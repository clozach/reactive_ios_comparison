//
//  ViewController.swift
//  InterstellarTest
//
//  Created by Hoverfly on 7/23/15.
//  Copyright (c) 2015 everyone. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var label: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()

    textField.rx_text >-
      throttle(1.0, MainScheduler.sharedInstance) >-
      subscribeNext {
      string in
      self.label.text = string
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

