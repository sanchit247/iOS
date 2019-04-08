import UIKit
class HorizontalScrollView:UIScrollView{
    let pageControl = UIPageControl()
    var cardsXPosition = 0
    var leftMargin: CGFloat = 0
    var topMargin: CGFloat = 5
    var cardWidth : CGFloat = 250
    var cardHeight : CGFloat = 100
    func setupScrollView(cards totalCards:Int){
        self.isScrollEnabled = false
        cardWidth = UIScreen.main.bounds.width - (2 * leftMargin)
        cardHeight = self.frame.height
        self.contentSize.width = (cardWidth * CGFloat(totalCards)) + (leftMargin * (CGFloat(totalCards) + 1))
        pageControl.tintColor = UIColor.gray
        pageControl.pageIndicatorTintColor = UIColor.red
        
//        pageControl.translatesAutoresizingMaskIntoConstraints = false
//        pageControl.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        pageControl.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
//        pageControl.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
//        pageControl.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
//        pageControl.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        
        for _ in 0...(totalCards-1){
            setupCards()
        }
       
    }
    func setupCards(){
//        let card = ViewCards(frame: CGRect(x: leftMargin + (self.frame.width * CGFloat(cardsXPosition)), y: topMargin, width: cardWidth, height: self.frame.height ))
        let card = ViewCards()
        card.translatesAutoresizingMaskIntoConstraints = false
        if cardsXPosition == 0{
            card.frame.origin.x = leftMargin + (self.frame.width * CGFloat(cardsXPosition))
            
        }
        else{
            card.frame.origin.x = 2 * leftMargin + (self.frame.width * CGFloat(cardsXPosition))
        }
        
        card.frame.origin.y = 5
        card.frame.size.height = cardHeight
        card.frame.size.width = cardWidth
        card.layoutIfNeeded()
        card.backgroundColor = cardsXPosition%2 == 0 ? UIColor.red : .green
        self.addSubview(card)
        self.bringSubviewToFront(card)
        cardsXPosition += 1
        print(self.frame.height, "  ", card.frame.height )
        print("card")
    }
    
    
}
