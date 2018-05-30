//
//  RatingControl.swift
//  CustomControlStackView
//
//  Created by Rene Haavre on 29/05/2018.
//  Copyright © 2018 Rene Haavre. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {

    //MARK: Properties
    private var ratingButtons = [UIButton]()
    var rating = 0
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0){
        didSet {
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5{
        didSet {
            setupButtons()
        }
    }
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Button action
    
    @objc func ratingButtonTapped(button: UIButton){
        print("Button pressed 👍")
    }
    
    //MARK: Private methods
    
    private func setupButtons(){
        
        for _ in 0..<starCount {
            //Create button
            let button = UIButton()
            button.backgroundColor = UIColor.red
            
            //Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Set the button action
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            ratingButtons.append(button)
        }
    }

}
