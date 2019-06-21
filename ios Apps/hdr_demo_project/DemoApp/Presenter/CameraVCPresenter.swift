import AVFoundation
private let kExposureDurationPower = 5.0 // Higher numbers will give the slider more sensitivity at shorter durations
private let kExposureMinimumDuration = 1.0/1000 // Limit exposure duration to a useful range
let exposureModes: [AVCaptureDevice.ExposureMode] = [.continuousAutoExposure, .locked, .custom]

class CameraVCPresenter{
    var vc : CameraViewController
    var captureSession: AVCaptureSession!
    var stillImageOutput: AVCapturePhotoOutput!
    var videoPreviewLayer: AVCaptureVideoPreviewLayer!
    var hdrEnabled : Bool = false
    init(vc : CameraViewController) {
        self.vc = vc
    }
    func setup(){
        self.vc.exposerControlView.isHidden = true
        self.vc.backCamera = AVCaptureDevice.default(for: AVMediaType.video)
        self.setupForImageCapture()
    }
    func setupForImageCapture(){
        self.captureSession = AVCaptureSession()
        self.captureSession.sessionPreset = .photo
        do {
            let input = try AVCaptureDeviceInput(device: self.vc.backCamera)
            self.stillImageOutput = AVCapturePhotoOutput()
            if self.captureSession.canAddInput(input) && self.captureSession.canAddOutput(self.stillImageOutput) {
                self.captureSession.addInput(input)
                self.captureSession.addOutput(self.stillImageOutput)
                self.setupLivePreview()
            }
        }
        catch let error  {
            print("Error Unable to initialize back camera:  \(error.localizedDescription)")
        }
    }
    func setupLivePreview() {
        self.videoPreviewLayer = AVCaptureVideoPreviewLayer(session: self.captureSession)
        self.videoPreviewLayer.videoGravity = .resizeAspect
        self.videoPreviewLayer.connection?.videoOrientation = .portrait
        self.vc.previewView.layer.addSublayer(self.videoPreviewLayer)
        self.vc.captureImageView.image = nil
        DispatchQueue.global(qos: .userInitiated).async { //[weak self] in
            self.captureSession.startRunning()
            DispatchQueue.main.async {
                self.videoPreviewLayer.frame = self.vc.previewView.bounds
            }
        }
    }
    func setExposure(mode: AVCaptureDevice.ExposureMode){
        do {
            try self.vc.backCamera!.lockForConfiguration()
            if self.vc.backCamera!.isExposureModeSupported(mode) {
                self.vc.backCamera!.exposureMode = mode
            } else {
                print("Exposure mode is not supported. Exposure mode is ", mode.rawValue)
            }
            self.vc.backCamera!.unlockForConfiguration()
        } catch let error {
            print("Could not lock device for configuration: \(error)")
        }
    }
    func capturePhoto(){
            let settings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])
            stillImageOutput.capturePhoto(with: settings, delegate: self.vc)
    }

    func ExposureValueSetting(with : Float){
        let p = pow(Double(with), kExposureDurationPower) // Apply power function to expand slider's low-end range
        let minDurationSeconds = max(CMTimeGetSeconds(self.vc.backCamera!.activeFormat.minExposureDuration), kExposureMinimumDuration)
        let maxDurationSeconds = CMTimeGetSeconds(self.vc.backCamera!.activeFormat.maxExposureDuration)
        let newDurationSeconds = p * ( maxDurationSeconds - minDurationSeconds ) + minDurationSeconds; // Scale from 0-1 slider range to actual duration
        do {
            try self.vc.backCamera!.lockForConfiguration()
            self.vc.backCamera!.setExposureModeCustom(duration: CMTimeMakeWithSeconds(newDurationSeconds, preferredTimescale: 1000*1000*1000), iso: AVCaptureDevice.currentISO, completionHandler: nil)
            self.vc.backCamera!.unlockForConfiguration()
        } catch let error {
            NSLog("Could not lock device for configuration: \(error)")
        }
    }
    
}
