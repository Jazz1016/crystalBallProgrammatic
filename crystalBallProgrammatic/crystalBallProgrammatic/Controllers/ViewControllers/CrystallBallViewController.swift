//
//  CrystallBallViewController.swift
//  crystalBallProgrammatic
//
//  Created by James Lea on 7/22/21.
//

import UIKit

class CrystalBallViewController: UIViewController {
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        
        self.view.addSubview(titleLabel)
        self.view.addSubview(imageView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        constrainAll()
    }
    
    // MARK: - Properties
    var safeArea: UILayoutGuide {
        return self.view.safeAreaLayoutGuide
    }
    
    // MARK: - Functions
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "James is the best"
        label.textAlignment = .center
        label.backgroundColor = .green
        
        return label
    }()
    
    let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "CrystalBall")
        
        return imageView
    }()
    
    func constrainAll(){
        titleLabel.anchor(top: self.safeArea.topAnchor, bottom: self.safeArea.bottomAnchor, leading: titleLabel.leadingAnchor, trailing: titleLabel.trailingAnchor, paddingTop: 16, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 200, height: 32)
        
        
    }
    
    
    
}//End of class
