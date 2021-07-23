//
//  CrystallBallViewController.swift
//  crystalBallProgrammatic
//
//  Created by James Lea on 7/22/21.
//

import UIKit
import AVKit
import AVFoundation

class CrystalBallViewController: UIViewController {
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        
        addSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        constrainAll()
        playVideo()
    }
    
    // MARK: - Properties
    var safeArea: UILayoutGuide {
        return self.view.safeAreaLayoutGuide
    }
    
    // MARK: - Functions
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Ask a question and shake the crystal ball to get a response"
        label.textAlignment = .center
        label.backgroundColor = .green
        label.numberOfLines = 0
        
        return label
    }()
    
    let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "CrystalBall")
        
        return imageView
    }()
    
    let safeAreaView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    func playVideo(){
        
        guard let path = Bundle.main.path(forResource: "stars", ofType: "mp4") else {return}
        let videoAsset = AVURLAsset(url: URL(fileURLWithPath: path))
        let playerItem = AVPlayerItem(asset: videoAsset)
        
//        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let player = AVQueuePlayer(playerItem: playerItem)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        safeAreaView.layer.addSublayer(playerLayer)
        player.volume = 0
        
        DispatchQueue.main.async {
            let loopItem = AVPlayerItem(asset: videoAsset)
            player.insert(loopItem, after: nil)
            
            player.play()
        }
    }
    
    func addSubviews(){
        self.view.addSubview(safeAreaView)
        self.view.addSubview(titleLabel)
        self.view.addSubview(imageView)
    }
    
    func constrainAll(){
        safeAreaView.anchor(top: self.safeArea.topAnchor, bottom: self.safeArea.bottomAnchor, leading: self.safeArea.leadingAnchor, trailing: self.safeArea.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0)
        
        imageView.frame = CGRect(x: self.view.frame.size.width/2 - 200, y: 96, width: 400, height: 400)
        
        titleLabel.frame = CGRect(x: self.view.frame.size.width/2 - 100, y: imageView.frame.maxY + 16, width: 200, height: 64)
        
//        titleLabel.anchor(top: imageView.bottomAnchor, bottom: nil, leading: titleLabel.leadingAnchor, trailing: titleLabel.trailingAnchor, paddingTop: 16, paddingBottom: 0, paddingLeft: 0, paddingRight: 0)
    }
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.alignment = .fill
        
        return stackView
    }()
    
}//End of class
