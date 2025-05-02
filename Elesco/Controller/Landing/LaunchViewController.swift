//
//  LaunchViewController.swift
//  Elesco
//
//  Created by Abhay on 02/05/25.
//

import UIKit
import AVFAudio
class LaunchViewController: UIViewController {
    
    @IBOutlet weak var animationImageView: UIImageView!

    var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let soundURL = Bundle.main.url(forResource: "Sound-Logo Intro_App", withExtension: "mp3") {
             do {
                 audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                 audioPlayer?.prepareToPlay()
             } catch {
                 print("Error loading sound file: \(error.localizedDescription)")
             }
         } else {
             print("Could not find sound file")
         }
        
 
            let imageData = try? Data(contentsOf: Bundle.main.url(forResource: "GIF_APP", withExtension: "gif")!)
               let advTimeGif = UIImage.gifImageWithData(imageData!)
               let imageView2 = UIImageView(image: advTimeGif)
            imageView2.frame = CGRect(x: 0.0, y: 0.0, width: (UIScreen.main.bounds.size.width), height: (UIScreen.main.bounds.size.height))
               animationImageView.addSubview(imageView2)
 
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.75) {
            let newView = self.storyboard?.instantiateViewController(withIdentifier: "LoginScreenViewController") as! LoginScreenViewController
            self.navigationController?.pushViewController(newView, animated: false)
        }

     }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Delay playback by 1 second
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            // Start playing the music
            self.audioPlayer?.play()
            
            // Stop the music after 3 seconds
            Timer.scheduledTimer(withTimeInterval: 4.0, repeats: false) { _ in
                self.audioPlayer?.stop()
            }
        }
    }
    


}
