//
//  MapViewController.swift
//  Magazine
//
//  Created by J Oh on 6/1/24.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var labelBackgroundView: UIView!
    @IBOutlet var resultLabel: UILabel!
    
    let list = RestaurantList.restaurantArray
    var filteredList: [Restaurant] = [] {
        didSet {
            mapView.removeAnnotations(mapView.annotations)
            showAnnotations(list: filteredList)
            mapView.region = filteredList.region()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "지도"
        mapView.delegate = self
        
        filteredList = list
        
        resultLabel.text = " 전체 - \(list.count)개 결과 "
        resultLabel.setting(size: 15, weight: .semibold)
        labelBackgroundView.layer.cornerRadius = 20
        labelBackgroundView.layer.backgroundColor = UIColor.systemBackground.cgColor
        
        let right = UIBarButtonItem(title: "필터", style: .plain, target: self, action: #selector(filterRestaurant))
        navigationItem.rightBarButtonItem = right
        
    }
    
    // 한식 카페 중식 분식 일식 경양식 양식
    @objc func filterRestaurant() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let all = UIAlertAction(title: "전체", style: .default) { _ in
            self.filteredList = self.list
            self.resultLabel.text = "전체 - \(self.list.count)개 결과"
        }
        
        let korean = UIAlertAction(title: "한식", style: .default) { _ in
            self.filteredList = self.list.filter { $0.category == "한식" }
            self.resultLabel.text = "한식 - \(self.filteredList.count)개 결과"
        }
        
        let asian = UIAlertAction(title: "아시안", style: .default) { _ in
            self.filteredList = self.list.filter { $0.category == "일식" || $0.category == "중식" }
            self.resultLabel.text = "아시안 - \(self.filteredList.count)개 결과"
        }
        
        let western = UIAlertAction(title: "양식 & 경양식", style: .default) { _ in
            self.filteredList = self.list.filter { $0.category == "양식" || $0.category == "경양식" }
            self.resultLabel.text = "양식 & 경양식 - \(self.filteredList.count)개 결과"
        }
        
        let cafe = UIAlertAction(title: "카페", style: .default) { _ in
            self.filteredList = self.list.filter { $0.category == "카페" }
            self.resultLabel.text = "카페 - \(self.filteredList.count)개 결과"
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(all)
        alert.addAction(korean)
        alert.addAction(asian)
        alert.addAction(western)
        alert.addAction(cafe)
        alert.addAction(cancel)
        
        present(alert, animated: true)
        
    }
}

extension MapViewController: MKMapViewDelegate {
    
    // any(5.6) some(5.1): Opaque Type
    func mapView(_ mapView: MKMapView, didSelect annotation: any MKAnnotation) {
        print("핀을 클릭했습니다")
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print("Region이 바뀌었습니다")
    }
    
    func showAnnotations(list: [Restaurant]) {
        for res in list {
            let annotation = MKPointAnnotation()
            annotation.coordinate = res.coordinate
            annotation.title = res.name
            mapView.addAnnotation(annotation)
        }
    }
}
