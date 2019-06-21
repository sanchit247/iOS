////
////  ViewController.swift
////  DemoApp
////
////  Created by mohit on 18/06/19.
////  Copyright © 2019 com.sanchit. All rights reserved.
////
//
//import UIKit
//import AVFoundation
//enum HDRMode{
//    case on
//    case off
//    case auto
//}
//class ViewController: UIViewController, AVCapturePhotoCaptureDelegate{
//
//    @IBOutlet weak var captureImageView: UIImageView!
//    @IBOutlet weak var previewView: UIView!
//    var captureSession: AVCaptureSession!
//    var stillImageOutput: AVCapturePhotoOutput!
//    var videoPreviewLayer: AVCaptureVideoPreviewLayer!
//    var hdrEnabled : Bool = false
//    var backCamera : AVCaptureDevice!
//    var presenter : CameraVCPresenter!
//    var currentHDRMode: HDRMode = .off
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        backCamera = AVCaptureDevice.default(for: AVMediaType.video)
//        presenter = CameraVCPresenter(vc: self)
//        configureCameraForHighestFrameRate(device: backCamera)
//        setupForImageCapture()
//
//    }
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        self.captureSession.stopRunning()
//
//    }
//    func setupForImageCapture(){
//        captureSession = AVCaptureSession()
//        captureSession.sessionPreset = .medium
//        setupHDR(HDR : false)
//    }
//    func setupHDR(HDR : Bool){
//        //print(backCamera.isVideoHDREnabled)
//
//        do {
//            let input = try AVCaptureDeviceInput(device: backCamera)
//            stillImageOutput = AVCapturePhotoOutput()
//            if captureSession.canAddInput(input) && captureSession.canAddOutput(stillImageOutput) {
//                captureSession.addInput(input)
//                captureSession.addOutput(stillImageOutput)
//                setupLivePreview()
//            }
//        }
//        catch let error  {
//            print("Error Unable to initialize back camera:  \(error.localizedDescription)")
//        }
//    }
//    func setupLivePreview() {
//
//        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
//
//        videoPreviewLayer.videoGravity = .resizeAspect
//        videoPreviewLayer.connection?.videoOrientation = .portrait
//        previewView.layer.addSublayer(videoPreviewLayer)
//
//        DispatchQueue.global(qos: .userInitiated).async { //[weak self] in
//            self.captureSession.startRunning()
//            DispatchQueue.main.async {
//                self.videoPreviewLayer.frame = self.previewView.bounds
//            }
//        }
//    }
//
//    @IBAction func didTakePhoto(_ sender: Any) {
//        let settings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])
//        stillImageOutput.capturePhoto(with: settings, delegate: self)
//    }
//    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
//
//        guard let imageData = photo.fileDataRepresentation()
//            else { return }
//
//        let image = UIImage(data: imageData)
//        captureImageView.image = image
//    }
//
//
//    @IBAction func toggleHDR(_ sender: Any) {
//        print(backCamera.activeFormat.isVideoStabilizationModeSupported(.cinematic))
//        if currentHDRMode == .off{
//            currentHDRMode = .on
//        }
//        else{
//            currentHDRMode = .off
//        }
//        switch currentHDRMode {
//        case .on:
//            setHDR(.off)
//        case .off:
//            setHDR(.auto)
//        case .auto:
//            setHDR(.on)
//        }
//    }
//    func setHDR(_ state: HDRMode) {
//        print(backCamera.activeFormat.isVideoStabilizationModeSupported(.auto))
//        guard backCamera.activeFormat.isVideoHDRSupported else {
//            print("isVideoHDRSupported is false")
//            return
//        }
//        do {
//            try backCamera.lockForConfiguration()
//            switch state {
//            case .on:
//                backCamera.automaticallyAdjustsVideoHDREnabled = false
//                backCamera.isVideoHDREnabled = true
//            case .off:
//                backCamera.automaticallyAdjustsVideoHDREnabled = false
//                backCamera.isVideoHDREnabled = false
//            case .auto:
//                backCamera.automaticallyAdjustsVideoHDREnabled = true
//            }
//            backCamera.unlockForConfiguration()
//        } catch {
//            print("Could not lock configuration")
//        }
//    }
//    func configureCameraForHighestFrameRate(device: AVCaptureDevice) {
//
//        var bestFormat: AVCaptureDevice.Format?
//        var bestFrameRateRange: AVFrameRateRange?
//
//        for format in device.formats {
//            for range in format.videoSupportedFrameRateRanges {
//                if range.maxFrameRate > bestFrameRateRange?.maxFrameRate ?? 0 {
//                    bestFormat = format
//                    bestFrameRateRange = range
//                }
//            }
//        }
//
//        if let bestFormat = bestFormat,
//            let bestFrameRateRange = bestFrameRateRange {
//            do {
//                try backCamera.lockForConfiguration()
//
//                // Set the device's active format.
//                backCamera.activeFormat = bestFormat
//
//                // Set the device's min/max frame duration.
//                let duration = bestFrameRateRange.minFrameDuration
//                backCamera.activeVideoMinFrameDuration = duration
//                backCamera.activeVideoMaxFrameDuration = duration
//                //                backCamera.automaticallyAdjustsVideoHDREnabled = false
//                //                backCamera.isVideoHDREnabled = true
//                backCamera.unlockForConfiguration()
//            } catch {
//                // Handle error.
//                print("error")
//            }
//        }
//    }
//
//}
//
//
