//
//  ViewController.swift
//  DemoApp
//
//  Created by mohit on 18/06/19.
//  Copyright © 2019 com.sanchit. All rights reserved.
//

import UIKit
import AVFoundation


class CameraViewController: UIViewController{
    @IBOutlet weak var exposerControlView: UIView!
    @IBOutlet weak var captureImageView: UIImageView!
    @IBOutlet weak var previewView: UIView!
    var backCamera : AVCaptureDevice!
    var presenter : CameraVCPresenter!
    var noOfPics = 0
    override func viewDidLoad() {
        super.viewDidLoad()
       
        presenter = CameraVCPresenter(vc: self)
        presenter.setup()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.presenter.captureSession.stopRunning()
    }
    
    @IBAction func didTakePhoto(_ sender: Any) {
        self.presenter.capturePhoto()
    }
    
    @IBAction func reTake(_ sender: Any) {
        self.presenter.setupLivePreview()
    }

    @IBAction func longExposerSetting(_ sender: UISegmentedControl) {
        exposerControlView.isHidden =  !exposerControlView.isHidden
        if sender.selectedSegmentIndex == 1 {
            self.presenter.setExposure(mode: exposureModes[2])
        }else{
            self.presenter.setExposure(mode: exposureModes[0])
        }
    }

    @IBAction func changeDuration(_ sender: UISlider) {
        self.presenter.ExposureValueSetting(with: sender.value)
    }

    @IBAction func toggleHDR(_ sender: UISegmentedControl) {
       self.presenter.hdrEnabled = !self.presenter.hdrEnabled
    }
 
}

