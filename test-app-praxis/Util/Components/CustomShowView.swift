//
//  CustomShowView.swift
//  Yummy Rides
//
//  Created by pedro.daza on 12/11/21.
//

import Foundation
import UIKit

class CustomShowView: CustomView {

    var isCallInitComponents = false
    var nameXIB: String {""}

    @IBOutlet weak var contentView: UIView!
        
    var isFirstCall = false
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //viewSetup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewSetup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewSetup()
    }
    
    private func loadViewFromNib() -> UIView? {

         let nibName = nameXIB
         let bundle = Bundle(for: type(of: self))
         let nib = UINib(nibName: nibName, bundle: bundle)
         return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }

    private func viewSetup() {
        
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        if !isFirstCall {
            self.addSubview(view)
            isFirstCall = true
        }
        
        contentView = view
        initComponents()
    }
    
    func initComponents(){

        
        
    }

}
