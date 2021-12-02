//
//  ContinentsViewController.swift
//  Countries
//
//  Created by Артем Соловьев on 01.12.2021.
//

import UIKit
import iCarousel
import RealmSwift

final class ContinentsViewController: UIViewController, iCarouselDataSource, iCarouselDelegate{
    
    weak var ContinentDelegate: ContinentDelegate?
    
    private var continents: Results<Continent>!
     
    // MARK: UI
    
    private let carousel : iCarousel = {
        let carousel = iCarousel()
        carousel.type = .cylinder
        return carousel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        view.addSubview(carousel)
        continents = realm.objects(Continent.self)
        carousel.dataSource = self
        carousel.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 300)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if carousel.currentItemIndex == 0{
            UIView.animate(withDuration: 0.1) {
                self.carousel.currentItemIndex = 1
            }
        }
        self.ContinentDelegate?.update(numberOfContinent: self.carousel.currentItemIndex)
    }
    
    // MARK: iCarouselDelegate
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view =  UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        if index == 0 {
            view.addTarget(self, action: #selector(action), for: .touchUpInside)
            view.setImage(UIImage(systemName: "plus"), for: .normal)
        }
        view.layer.cornerRadius = view.bounds.height/2
        view.backgroundColor = .init(hex: continents[index].color)
        if index == 0{view.backgroundColor = .white}
        return view
    }
    
    @objc func action(){
        if carousel.currentItemIndex == 0 {
            let vc = NewListViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
    }
    
    // MARK: iCarouselDataSource
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        continents.count
    }
}
