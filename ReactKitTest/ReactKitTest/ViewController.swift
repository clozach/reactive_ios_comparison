//
//  ViewController.swift
//  InterstellarTest
//
//  Created by Hoverfly on 7/23/15.
//  Copyright (c) 2015 everyone. All rights reserved.
//

import UIKit
import ReactKit

class ViewController: UIViewController {

  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var label: UILabel!

  var stream: Stream<NSString?>?

  override func viewDidLoad() {
    super.viewDidLoad()

    stream = textField!.textChangedStream()
      |> throttle(1.0)

    (label, "text") <~ stream!
    // Why doesn't the following work?!
    // stream! ~> (label, "text")
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

