//
//  WarriorView.swift
//  Jeu
//
//  Created by Djiva Canessane on 07/02/2020.
//  Copyright © 2020 Djiva Canessane. All rights reserved.
//

import UIKit

@IBDesignable
class WarriorView: UIView {
    
    let nibName = "WarriorView"
    var contentView:UIView?
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var healthLabel: UILabel!
    @IBOutlet weak var staminaLabel: UILabel!
    
    private func createView() -> WarriorView {
      let nib = UINib(nibName: "WarriorView", bundle: nil)
      if let view = nib.instantiate(withOwner: nil, options: nil).last as? WarriorView {
        return view
      } else {
        fatalError()
      }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        commonInit()
//    }
//
    func commonInit() {
        let view = createView()
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
    }
//
//    func loadViewFromNib() -> UIView? {
//
//        let bundle = Bundle(for: type(of: self))
//        return bundle.loadNibNamed("WarriorView", owner: self, options: nil)?.first as? UIView
//
//
//
//    }
}
