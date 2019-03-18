
import UIKit
import Firebase
import AVFoundation
class RemoteViewController: UIViewController , realTimeUpdate {
    
    let imgArray = ["img1","img2","img3","img4","img5","img6"]
    var counter = 0
    
    @IBOutlet weak var tempImageView: UIImageView!
    
    @IBOutlet weak var autoPilotSwitch: UISwitch!
    
    let options = VisionFaceDetectorOptions()
    lazy var vision = Vision.vision()
    
    
    @IBOutlet weak var nearestObjLabel: UILabel!
    // variable for switch status indicator (remote mode or auto pilot mode)
    @IBOutlet weak var modeIndicator: UILabel!
    var myRobo : RoboClass!
    
    @IBOutlet var upLongPressGesture: UILongPressGestureRecognizer!
    
    @IBOutlet var downLongPressGesture: UILongPressGestureRecognizer!
    @IBOutlet var rightLongPressGesture: UILongPressGestureRecognizer!
    @IBOutlet var leftLongPressGesture: UILongPressGestureRecognizer!
    override func viewDidLoad() {
        super.viewDidLoad()
        myRobo = RoboClass(roboId:"Robo1",distance:1,speed:10,delegate:self )
        myRobo?.dataUpdates()
        upLongPressGesture.name = "up"
        downLongPressGesture.name = "down"
        leftLongPressGesture.name = "left"
        rightLongPressGesture.name = "right"
        
        // High-accuracy landmark detection and face classification
        
        options.performanceMode = .accurate
        options.landmarkMode = .all
        options.classificationMode = .all
        
        // Real-time contour detection of multiple faces
        
        options.contourMode = .all
        
    }

    @IBAction func switchPressed(_ sender: UISwitch) {
        if sender.isOn{
            view.backgroundColor = UIColor.gray
            view.isOpaque = true
            modeIndicator.text = "AUTO PILOT"
            modeIndicator.textColor = UIColor.red
            myRobo.setAutoPilot(state: 1)
        }
        else
        {
            view.backgroundColor = UIColor.white
            view.isOpaque = false
            modeIndicator.textColor = UIColor.blue
            modeIndicator.text = "REMOTE MODE"
            myRobo.setAutoPilot(state: 0)
        }
    }
    
    @IBAction func logoutBtnPressed(_ sender: UIButton) {
      // use if here to check logout
        myRobo?.logOut()
       self.performSegue(withIdentifier: "showFirstPage", sender: self)
    }

   
    
    func nearestObjectupdate(distanceResult: Int64) {
        nearestObjLabel.text = "Nearest Object: \(distanceResult) meters"
    }
 
//    @IBAction func moveBtnReleased(_ sender: UIButton) {
//        myRobo.stop(direction: sender.moveDirection)
//    }
    
    
    @IBAction func movementBtnPressed(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began{
          
           myRobo.move(direction: sender.name!)
        }
        
        if sender.state == .ended {
           myRobo.stop(direction: sender.name!)
        }
        
    }
    
    @IBAction func changePic(_ sender: UIButton) {
        
        tempImageView.image = UIImage(named: imgArray[counter])
        if counter < 5{
            counter += 1
        }
        else{
            counter = 0
        }
        let faceDetector = vision.faceDetector(options: options)
        let image = VisionImage(image: tempImageView.image!)
        let metadata = VisionImageMetadata()
        
        // Using back-facing camera
//        let devicePosition: AVCaptureDevice.Position = .back
//
//        let deviceOrientation = UIDevice.current.orientation
//        switch deviceOrientation {
//        case .portrait:
//            metadata.orientation = devicePosition == .front ? .leftTop : .rightTop
//        case .landscapeLeft:
//            metadata.orientation = devicePosition == .front ? .bottomLeft : .topLeft
//        case .portraitUpsideDown:
//            metadata.orientation = devicePosition == .front ? .rightBottom : .leftBottom
//        case .landscapeRight:
//            metadata.orientation = devicePosition == .front ? .topRight : .bottomRight
//        case .faceDown, .faceUp, .unknown:
//            metadata.orientation = .leftTop
//        }
        
        image.metadata = metadata
        faceDetector.process(image) { features, error in
            guard error == nil, let features = features, !features.isEmpty else {
                // ...
                print("none")
                return
            }
            
            // Faces detected
            // ...
            var happyFaces = 0
            for face in features {
                print("enter")
                let frame = face.frame
                
                if face.hasHeadEulerAngleY {
                    let rotY = face.headEulerAngleY  // Head is rotated to the right rotY degrees
                }
                if face.hasHeadEulerAngleZ {
                    let rotZ = face.headEulerAngleZ  // Head is rotated upward rotZ degrees
                }
                
                // If landmark detection was enabled (mouth, ears, eyes, cheeks, and
                // nose available):
                if let leftEye = face.landmark(ofType: .leftEye) {
                    let leftEyePosition = leftEye.position
                    
                }
                
                // If contour detection was enabled:
                if let leftEyeContour = face.contour(ofType: .leftEye) {
                    let leftEyePoints = leftEyeContour.points
                }
                if let upperLipBottomContour = face.contour(ofType: .upperLipBottom) {
                    let upperLipBottomPoints = upperLipBottomContour.points
                }
                
                // If classification was enabled:
                if face.hasSmilingProbability {
                    let smileProb = face.smilingProbability
                    if smileProb > 0.95 { happyFaces += 1}
                }
                if face.hasRightEyeOpenProbability {
                    let rightEyeOpenProb = face.rightEyeOpenProbability
                }
                
                // If face tracking was enabled:
                if face.hasTrackingID {
                    let trackingId = face.trackingID
                    
                }
            }
            let alertController = UIAlertController(title: "Face Detection", message:
                "total faces in the image \(features.count) and \(happyFaces) of them are smiling", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
        }
        
            
            
        }
       
        
    
    
}
