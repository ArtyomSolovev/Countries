//
//  ContinentsViewController.swift
//  Countries
//
//  Created by Артем Соловьев on 01.12.2021.
//

import UIKit
import iCarousel

class ContinentsViewController: UIViewController, iCarouselDataSource, iCarouselDelegate{
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        10
    }
    func carousel(_ carousel: iCarousel, shouldSelectItemAt index: Int) -> Bool {
        print(index)
        return true
    }
    func carousel(_ carousel: iCarousel, shouldSelectItemAt index: Int) {
        UIView.animate(withDuration: 0.3) {
            self.x.currentItemIndex = 1
        }
        print("@Q@")
        print(index)
        let x = ViewController()
        present(x, animated: true, completion: nil)
        
    }
    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        UIView.animate(withDuration: 0.3) {
            self.x.currentItemIndex = 1
        }
        print("@@@")
        print(index)
        let x = ViewController()
        present(x, animated: true, completion: nil)
        
    }
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view =  UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.addTarget(self, action: #selector(info), for: .touchUpInside)
        view.layer.cornerRadius = view.bounds.height/2
        view.backgroundColor = .random()
        if index == 0{view.backgroundColor = .white}
        return view
    }
    @objc func info(){
        if x.currentItemIndex == 0 {
            let x = NewListViewController()
            x.modalPresentationStyle = .fullScreen
            present(x, animated: true, completion: nil)
        }
    }
    
    let x:iCarousel = {
        let x = iCarousel()
        x.type = .cylinder
        return x
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            UIView.animate(withDuration: 0.3) {
//                self.x.currentItemIndex = 1
//            }
//        }
        
        view.backgroundColor = .blue
        view.addSubview(x)
//        configureCarousel()
        x.dataSource = self
        x.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 300)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if x.currentItemIndex == 0{
            UIView.animate(withDuration: 0.1) {
                self.x.currentItemIndex = 1
            }
        }
        print("?????",x.currentItemIndex)
    }
}
extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}
