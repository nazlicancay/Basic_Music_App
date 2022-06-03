//
//  ViewController.swift
//  MyMusicApp
//
//  Created by Nazlıcan Çay on 20.03.2022.
//

import UIKit
import AVFAudio

class ViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    var songs = [Song]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigureSongs()
        // Do any additional setup after loading the view.
        table.delegate = self;
        table.dataSource = self;
        
        
    }
    func ConfigureSongs(){
        songs.append(Song(name: "Wating For Love", albumName: "123 aaa", imageName: "Cover3", trackName: "song1",ArtistName: "avicii"))
        songs.append(Song(name: "Addicted To You", albumName: "123 bbb", imageName: "Cover1", trackName: "song2",ArtistName: "avicii"))
        songs.append(Song(name: "Ahu", albumName: "123 ccc", imageName: "Cover2", trackName: "song3",ArtistName: "mabelmatiz"))
        songs.append(Song(name: "Wating For Love", albumName: "123 aaa", imageName: "Cover3", trackName: "song1",ArtistName: "avicii"))
        songs.append(Song(name: "Addicted To You", albumName: "123 bbb", imageName: "Cover1", trackName: "song2",ArtistName: "avicii"))
        songs.append(Song(name: "Ahu", albumName: "123 ccc", imageName: "Cover2", trackName: "song3",ArtistName: "mabelmatiz"))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        // config cell
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 16)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // present the player
        let postion = indexPath.row
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "player") as? PlayerViewController else{ return }
        vc.songs = songs
        vc.postion = postion
        present(vc, animated: true)
    }
    
   public struct Song{
        let name : String
        let albumName : String
        let imageName : String
        let trackName : String
       let ArtistName : String
    }


}

