//
//  ViewController.swift
//  collectionviewAND PAGE VIEW
//
//  Created by macbook on 13/07/2023.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet weak var pagecontrole: UIPageControl!
    @IBOutlet weak var collectionview: UICollectionView!
    var b = ["c1","c2","c3","c4"]
    var currentpage = 0
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return b.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! myCollectionViewCell
        
        cell.img1.image = UIImage(named: b[indexPath.row])
        
        
        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        pagecontrole.numberOfPages = 4
        pagecontrole.currentPage = currentpage
        
//        let swiperight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondtoswipegesture))
//        swiperight.direction = UISwipeGestureRecognizer.Direction.right
//        self.view.addGestureRecognizer(swiperight)
//
//        let swipeleft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondtoswipegesture))
//        swipeleft.direction = UISwipeGestureRecognizer.Direction.left
//        self.view.addGestureRecognizer(swipeleft)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pagecontrole.currentPage = indexPath.row
    }
    
//    @objc func respondtoswipegesture(gesture: UIGestureRecognizer) {
//        if let swipegesture = gesture as? UISwipeGestureRecognizer {
//            switch swipegesture.direction {
//            case UISwipeGestureRecognizer.Direction.right:
//                if currentpage > 0 {
//                    currentpage -= 1
//                }
//            case UISwipeGestureRecognizer.Direction.left:
//                if currentpage < b.count - 1 {
//                    currentpage += 1
//                }
//            default:
//                break
//            }
//            pagecontrole.currentPage = currentpage
//        }
//     }

    @IBAction func pagecontrolebtn(_ sender: Any) {
        currentpage = pagecontrole.currentPage
               collectionview.scrollToItem(at: IndexPath(item: currentpage, section: 0), at: .centeredHorizontally, animated: true)
           }
}

