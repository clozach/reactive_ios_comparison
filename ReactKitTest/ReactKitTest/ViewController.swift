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

  func dubble(string: NSString?) -> Int {
    if let s = string, let i = String(s).toInt() {
      return i * 2
    }
    return 0
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    // Argh!
    stream = textField!.textChangedStream()
      |> throttle(1.0)
      |> map {
        var str = ""
        if let s = $0 {
          str = String(s)
        }
        return str
      }
      |> map { $0 } // What?! Xcode claims $0 is still NSString here! That's not how map is supposed to work, is it???

    // Not sure why this doesn't work.
    // The signature for map is ostensibyly T->U, just like RxSwift and Interstellar.
//    stream = textField!.textChangedStream()
//      |> throttle(1.0)
//      |> map(dubble)

    (label, "text") <~ stream!
    // Why doesn't the following work?!
    // stream! ~> (label, "text")
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

