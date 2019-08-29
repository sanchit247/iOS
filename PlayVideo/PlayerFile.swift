// import AVkit
// make a variable player as

// var player = AVPlayer()

// call below method to viewDidAppear or viewDidLoad

//MARK:- Settings for AVPlayer
    func setUpAVPlayer() {
//        guard let path = Bundle.main.path(forResource: "printScreenVideo", ofType:"mp4") else {
//            return
//        }
        let fileUrl = NSURL(fileURLWithPath: "path/name.mp4")
       // let url = NSURL.fileURL(withPath: path)
        self.player = AVPlayer(url: fileUrl as URL)
        NotificationCenter.default.addObserver(self, selector:#selector(self.playerDidFinishPlaying(note:)),name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player.currentItem)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.parentView.bounds
        playerLayer.zPosition = -1 // makes it background
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill // set to full screen
        self.parentView.layer.addSublayer(playerLayer)
        player.play()

    }
    //MARK:- Called when AVPlayer finished playing
    @objc func playerDidFinishPlaying(note: NSNotification) {
        print("finish playing")
        self.player.seek(to: kCMTimeZero)
        self.player.play()
    }
