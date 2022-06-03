//
//  PlayerViewController.swift
//  MyMusicApp
//
//  Created by Nazlıcan Çay on 21.03.2022.
//  Copyright © 2022 ncancay. All rights reserved.
//
import AVFoundation
import UIKit

class PlayerViewController: UIViewController {
    
    public var postion: Int = 0
    public var songs: [ViewController.Song] = []
    var player:AVAudioPlayer?
    
    
    // user ınterface elements
    private let albumImageView : UIImageView = {
            let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        return imageview
    }()
    
    private let songNameLabel : UILabel = {
            let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let ArtistNameLabel : UILabel = {
            let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let AlbumNameLabel : UILabel = {
            let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    
    @IBOutlet var holder: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if holder.subviews.count == 0{
            configure()
        }
    }
    
    func configure(){
        //set up the player
        let song = songs[postion]
        
        let urlString = Bundle.main.path(forResource: song.trackName, ofType: "mp3")
        
        do{
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true,options: .notifyOthersOnDeactivation)
            
            guard let urlString = urlString else{return}
            
            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
            player!.play()
        }
        catch{
            print("Error")}
            
        // album cover
            albumImageView.frame = CGRect(x: 10, y: 10, width:
                                            holder.frame.size.width-20, height: holder.frame.size.width-20)
            albumImageView.image =  UIImage(named: song.imageName)
            holder.addSubview(albumImageView)
            
        // Labels songname,albumname, artist name
            
            songNameLabel.frame = CGRect(x: 10, y: albumImageView.frame.size.height+10, width:
                                            holder.frame.size.width-20, height: 50)
            AlbumNameLabel.frame = CGRect(x: 10, y: albumImageView.frame.size.height+80, width:
                                            holder.frame.size.width-20, height: 50)
            ArtistNameLabel.frame = CGRect(x: 10, y: albumImageView.frame.size.height+180, width:
                                            holder.frame.size.width-20, height: 50)
        
            songNameLabel.text = song.name
            AlbumNameLabel.text = song.albumName
            ArtistNameLabel.text = song.ArtistName
            
            
            holder.addSubview(songNameLabel)
            holder.addSubview(AlbumNameLabel)
            holder.addSubview(ArtistNameLabel)
            
        // Player Controlers
            
            
        
      
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = player{player.stop()}
    }
    
  

}
