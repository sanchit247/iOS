import UIKit
import AVFoundation

// extension for getting captured image
extension CameraViewController : AVCapturePhotoCaptureDelegate{
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let imageData = photo.fileDataRepresentation() else { return }
        
        let image = UIImage(data: imageData)
        captureImageView.image = image
        if self.presenter.hdrEnabled{
            CameraFeature.shared.hdCapturedImage = image!
        }
        else{
            CameraFeature.shared.capturedImage = image!
        }
        self.presenter.captureSession.stopRunning()
    }
}
