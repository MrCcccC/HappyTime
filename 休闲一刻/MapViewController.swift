//
//  MapViewController.swift
//  每日一乐
//
//  Created by 5201-mac on 2017/4/17.
//  Copyright © 2017年 5201-mac. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: BaseViewController {
    var mainMapView: MKMapView!
    var location:CLLocation?
    var Search:UISearchBar!
    //定位管理器
      let locationManager:CLLocationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "地图"
        setupUI()
        setLocation()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
   
    
}
extension MapViewController:CLLocationManagerDelegate,UISearchBarDelegate,MKMapViewDelegate{
    override func setupadimitView() {
        
    }
    //添加地图信息
    func setLocation(){
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        if (CLLocationManager.locationServicesEnabled()){
            //允许使用定位服务的话，开始定位服务更新
            locationManager.startUpdatingLocation()
            print("定位开始")
            
        }
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.startUpdatingLocation()
        
        
        self.mainMapView = MKMapView(frame:self.view.frame)
        self.view.insertSubview(mainMapView, belowSubview: navigationBar)
        mainMapView!.showsUserLocation=true//开启定位
        //地图类型设置 - 标准地图
        self.mainMapView.mapType = MKMapType.standard
        setmyLocation()
        setSearchBar()
    }
    
    //添加searchbar
    func setSearchBar(){
        Search = UISearchBar(frame: CGRect(x: 0, y: 62, width: self.view.bounds.width, height: 40))
        //Search.showsCancelButton = true
        Search.delegate = self
        self.view.insertSubview(Search, aboveSubview: mainMapView)
        
        
    }
    
    //设置地图显示区域
    func setmyLocation(a:Double = 0.5,b:Double = 0.5){
        //创建一个MKCoordinateSpan对象，设置地图的范围（越小越精确）
        let latDelta = a
        let longDelta = b
        var center:CLLocation=CLLocation()
        let currentLocationSpan:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        //let center = locationManager.location?.coordinate
        //使用自定义位置
        if location == nil {
            center = CLLocation(latitude: 29.90, longitude: 121.55)
        }else{
            center = location!
        }
        
        let currentRegion:MKCoordinateRegion = MKCoordinateRegion(center:center.coordinate,
                                                                  span: currentLocationSpan)
        
        //设置显示区域
        self.mainMapView.setRegion(currentRegion, animated: true)
        
    }
}




//实现代理
extension MapViewController{
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //获取最新的坐标
        var  currLocation : CLLocation = locations.last!  // 持续更新
        location = currLocation
        // 获取经纬度
        print( "纬度:\(location?.coordinate.latitude)")
        //locationManager.stopUpdatingLocation()
        
    }
    
    //虚拟键盘搜索键的点击事件
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        for i in mainMapView.annotations {
            self.mainMapView.removeAnnotation(i)
        }
        print("正在搜索")
        
        guard let searchlocation = Search.text else {
            return
        }
        
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(searchlocation) { (pls: [CLPlacemark]?, error: Error?)  in
            if error == nil {
                guard let plsResult = pls else {return}
                DispatchQueue.global().async {
                    let firstPL = plsResult.first
                    self.location = firstPL?.location
                }
                DispatchQueue.main.async {
                    self.setmyLocation(a: 0.01, b: 0.01)
                    //创建一个大头针对象
                    let objectAnnotation = MKPointAnnotation()
                    //设置大头针的显示位置
                    objectAnnotation.coordinate = CLLocation(latitude: (self.location?.coordinate.latitude)!,
                                                             longitude: (self.location?.coordinate.longitude)!).coordinate
                    //设置点击大头针之后显示的标题
                    objectAnnotation.title = "您搜索的地点"
                    //设置点击大头针之后显示的描述
                    objectAnnotation.subtitle = searchlocation
                    //添加大头针
                    self.mainMapView.addAnnotation(objectAnnotation)
                }
                
                
            }else {
                let alert = UIAlertView(title: "错误", message: "您搜索的地点有错误，请重新输入正确的地点", delegate: nil, cancelButtonTitle: "确定")
                alert.show()
            }
        }
    }
    
    
    //自定义大头针
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation)
        -> MKAnnotationView? {
            if annotation is MKUserLocation {
                return nil
            }
            
            let reuserId = "pin"
            var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuserId)
                as? MKPinAnnotationView
            if pinView == nil {
                //创建一个大头针视图
                pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuserId)
                pinView?.canShowCallout = true
                pinView?.animatesDrop = true
                //设置大头针颜色
                pinView?.pinTintColor = UIColor.green
                //设置大头针点击注释视图的右侧按钮样式
                pinView?.rightCalloutAccessoryView = UIButton(type: .infoLight)
            }else{
                pinView?.annotation = annotation
            }
            
            return pinView
    }
}
