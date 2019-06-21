//
//  DisplayImageViewController.swift
//  DemoApp
//
//  Created by mohit on 20/06/19.
//  Copyright © 2019 com.sanchit. All rights reserved.
//

import UIKit

class DisplayImageViewController: UIViewController {

    @IBOutlet weak var normalImage: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    var hdrSetting = [-0.5 , 0 , 0.5] // negative for dark positive for bright
    var hdrImageClass : CameraFeature!
    var hdrImages = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImages()
    }
    // function to load normal and hd images to the image view
    func setupImages(){
        normalImage.image = CameraFeature.shared.capturedImage ?? UIImage(named: "noImage")
        if CameraFeature.shared.hdCapturedImage != nil{
            let image = CameraFeature.shared.hdCapturedImage
            for i in 0..<hdrSetting.count{
                hdrImages.append(CameraFeature.shared.imageWithAdjustedExposure(ev: Double(hdrSetting[i]), image: image)!)
            }
            imageView.image = CameraFeature.shared.generateHDR(images: hdrImages)
            hdrImages.removeAll()
        }
        else{
            imageView.image = UIImage(named: "noImage")
        }
    }
}
