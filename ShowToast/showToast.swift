// This function is used to display a toast on the screen as android

func showToast(message : String, yPosition: CGFloat = 20) {
        
        let toastLabel = UILabel()
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.numberOfLines = 0
        toastLabel.clipsToBounds  =  true
        let maxSize = CGSize(width: view.width - 40, height: 300)
        let size = toastLabel.sizeThatFits(maxSize)
        toastLabel.frame.size.width = size.width + 20
        toastLabel.center.x = view.center.x
        toastLabel.frame.origin.y = yPosition
        toastLabel.frame.size.height = 30
        self.view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
