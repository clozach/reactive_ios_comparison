import ReactiveCocoa

// http://blog.scottlogic.com/2014/07/24/mvvm-reactivecocoa-swift.html
extension RACSignal {
  func subscribeNextAs<T>(nextClosure:(T) -> ()) -> () {
    self.subscribeNext {
      (next: AnyObject!) -> () in
      if let nextAsT = next as? T {
        nextClosure(nextAsT)
      }
    }
  }
}
