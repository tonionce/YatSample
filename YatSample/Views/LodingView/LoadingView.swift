//
//  LoadingView.swift
//  YatSample
//
//  Created by Viedma, Antonio on 23/09/2017.
//  Copyright © 2017 Antonio Viedma. All rights reserved.
//

import UIKit

class LoadingView: UIView {
   
   @IBOutlet private weak var activiyIndicator: UIActivityIndicatorView!
   @IBOutlet private var view: UIView!
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      setupNib()
   }
   
   public init() {
      super.init(frame: CGRect.zero)
      setupNib()
   }
   
   required public init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      setupNib()
   }
   
   private func setupNib() {
      view = loadFromNib()
      view.layer.cornerRadius = 10
      view.translatesAutoresizingMaskIntoConstraints = false
      addSubview(view)
      addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: [], metrics: nil, views: ["view": view]))
      addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options: [], metrics: nil, views: ["view": view]))
   }
   
   private func loadFromNib() -> UIView {
      let view = UINib(nibName: String(describing: LoadingView.self), bundle: nil).instantiate(withOwner: self, options: nil).first as! UIView
      return view
   }

   func show() {
      show(true)
      activiyIndicator.startAnimating()
   }
   
   func hide() {
      activiyIndicator.stopAnimating()
      show(false)
   }
   
   private func show(_ show: Bool) {
      UIView.animate(withDuration: 0.5) {
         self.alpha = show ? 1 : 0
      }
   }

}
