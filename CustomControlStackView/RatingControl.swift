//
//  RatingControl.swift
//  CustomControlStackView
//
//  Created by Rene Haavre on 29/05/2018.
//  Copyright © 2018 Rene Haavre. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {

    //MARK: Properties
    private var ratingButtons = [UIButton]()
    
    var rating = 0
    
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
        
        for _ in 0..<5 {
            //Create button
            let button = UIButton()
            button.backgroundColor = UIColor.red
            
            //Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
            button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Set the button action
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            ratingButtons.append(button)
        }
    }

}
