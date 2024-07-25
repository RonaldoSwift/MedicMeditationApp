//
//  DetalleMusicMediaPlayer.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 24/07/24.
//

import Foundation
import AVFoundation
import Combine

class DetalleMusicMediaPlayer {
    private var avPlayer: AVPlayer
    private var timeObserverToken: Any?
    let NSEC_PER_SEC = 2400
    
    var currentProgressPublisher: PassthroughSubject<Float, Never> = .init()
    var currentTimeInSecondsPublisher: PassthroughSubject<Double, Never> = .init()
    
    init(avPlayer: AVPlayer, timeObserverToken: Any? = nil, currentProgressPublisher: PassthroughSubject<Float, Never>, currentTimeInSecondsPublisher: PassthroughSubject<Double, Never>) {
        self.avPlayer = avPlayer
        self.timeObserverToken = timeObserverToken
        self.currentProgressPublisher = currentProgressPublisher
        self.currentTimeInSecondsPublisher = currentTimeInSecondsPublisher
    }
    
    func inicializarAVPLayer(url : String) {
        let url = URL(string: url)
        //let playerItem: AVPlayerItem = AVPlayerItem(url: url!)
        avPlayer = AVPlayer(url: url!)
        addPeriodicObserver(for: avPlayer)
    }
    
    var isPlaying: Bool {
        avPlayer.rate != 0
    }
    
    private var duration: Double {
        avPlayer.currentItem?.duration.seconds ?? 0
    }
    
    private func addPeriodicObserver(for player: AVPlayer) {
        let timeScale = CMTimeScale(NSEC_PER_SEC)
        let time = CMTime(seconds: 0.5, preferredTimescale: timeScale)
        
        timeObserverToken = player.addPeriodicTimeObserver(forInterval: time, queue: .main, using: { [weak self] time in
            guard let self = self else { return }
            let progress = calculateProgress(currentTime: time.seconds)
            currentProgressPublisher.send(progress)
            currentTimeInSecondsPublisher.send(time.seconds)
        })
    }
    
    private func calculateProgress(currentTime: Double) -> Float {
        Float(currentTime / duration)
    }
    
    func play() {
        avPlayer.play()
    }
    
    func pause() {
        guard isPlaying else {
            return print("Attempting to pause while not playing.")
        }
        avPlayer.pause()
    }
}
