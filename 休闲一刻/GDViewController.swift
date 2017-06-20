//
//  GDViewController.swift
//  休闲一刻
//
//  Created by 5201-mac on 2017/6/13.
//  Copyright © 2017年 5201-mac. All rights reserved.
//

//
//  GDViewController.swift
//  休闲一刻
//
//  Created by 5201-mac on 2017/6/13.
//  Copyright © 2017年 5201-mac. All rights reserved.
//

import UIKit
import FTIndicator

class GDViewController: BaseViewController,MAMapViewDelegate ,AMapSearchDelegate,AMapLocationManagerDelegate,AMapNaviWalkManagerDelegate{
    var mapView:MAMapView!
    var location:AMapLocationManager!
    var search : AMapSearchAPI!
    var Searchbar:UISearchBar! //定义一个搜索栏
    var annotations : [MAPointAnnotation] = []//定义一个数组
    var start,end : CLLocationCoordinate2D!
    var WalkManager:AMapNaviWalkManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setMapView()
        setSearchBar()
        //初始化搜索的
        search = AMapSearchAPI()
        search.delegate = self
        
        WalkManager = AMapNaviWalkManager()
        WalkManager.delegate = self
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        location.stopUpdatingLocation()
        return
    }
    
    //屏幕点击关闭输入法
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    
}
extension GDViewController:UISearchBarDelegate{
    override func setupadimitView() {
        
    }
    //创建地图视图
    func setMapView(){
        title = "地图"
        mapView = MAMapView(frame: view.bounds)
        view.addSubview(mapView)
        mapView.zoomLevel = 17 //地图缩放
        mapView.delegate = self //实现代理
        mapView.showsUserLocation = true//显示定位
        mapView.userTrackingMode = .follow // 持续定位
        location = AMapLocationManager()
        location.delegate = self
        location.distanceFilter = 20
        location.locatingWithReGeocode = true
        location.startUpdatingLocation()
        view.insertSubview(mapView, belowSubview: navigationBar)
        
    }
    
    //添加searchbar
    func setSearchBar(){
        Searchbar = UISearchBar(frame: CGRect(x: 0, y: 62, width: self.view.bounds.width, height: 40))
        //Search.showsCancelButton = true
        Searchbar.delegate = self
        view.insertSubview(Searchbar, aboveSubview: mapView)
    }
    
    
    //搜索按钮点击后相应事件
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        mapView.removeAnnotations(annotations)
        annotations.removeAll()
        guard let searchlocation = Searchbar.text else {
            return
        }
        //实现关键词搜索
        let request = AMapInputTipsSearchRequest()
        request.keywords = searchlocation
        search.aMapInputTipsSearch(request)
        
    }
    
    //调用搜索后的回调
    func onInputTipsSearchDone(_ request: AMapInputTipsSearchRequest!, response: AMapInputTipsSearchResponse!)  {
        guard  response.count > 0 else {
            return
        }
        
        //创建大头针
        for address in response.tips{
            let annotation = MAPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(address.location.latitude), longitude: CLLocationDegrees(address.location.longitude))
            annotation.title = address.address
            annotation.subtitle = address.name
            annotations.append(annotation)
        }
        
        mapView.addAnnotations(annotations)
        mapView.showAnnotations(annotations, animated: true)
        
    }
    //  MARK: - MapView delegate  地图大头针点击事件
    func mapView(_ mapView: MAMapView!, didSelect view: MAAnnotationView!) {
        end = view.annotation.coordinate
        
        let startPoint = AMapNaviPoint.location(withLatitude: CGFloat(start.latitude), longitude: CGFloat(start.longitude))
        let endPoint = AMapNaviPoint.location(withLatitude: CGFloat(end.latitude), longitude: CGFloat(end.longitude))
        WalkManager.calculateWalkRoute(withStart: [startPoint!], end: [endPoint!])
        
    }
    //绘制折线
    func mapView(_ mapView: MAMapView!, rendererFor overlay: MAOverlay!) -> MAOverlayRenderer! {
        if overlay is MAPolyline {
            mapView.visibleMapRect = overlay.boundingMapRect
            let renderer = MAPolylineRenderer(overlay: overlay)
            renderer?.lineWidth = 6.0
            renderer?.strokeColor = UIColor.blue
            return renderer
        }
        return nil
    }
    
    
    //MARK: - 持续定位代理
    func amapLocationManager(_ manager: AMapLocationManager!, didUpdate location: CLLocation!) {
        start = location.coordinate
        print(location.coordinate)
    }
    
    //自定义大头针
    func mapView(_ mapView: MAMapView!, viewFor annotation: MAAnnotation!) -> MAAnnotationView! {
        if annotation is MAUserLocation{
            return nil
        }
        let reuserID = "myid"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuserID) as? MAPinAnnotationView
        if annotationView == nil {
            annotationView = MAPinAnnotationView(annotation: annotation, reuseIdentifier: reuserID)
            
        }
        
        annotationView?.animatesDrop = true
        annotationView?.canShowCallout = true
        
        return annotationView
    }
    
    //MARK: - 导航代理
    func walkManager(onCalculateRouteSuccess walkManager: AMapNaviWalkManager) {

        mapView.removeOverlays(mapView.overlays)
        var coordinates : [CLLocationCoordinate2D] = []
//        for item in (walkManager.naviRoute?.routeCoordinates)!{
//            let a = CLLocationCoordinate2D(latitude: CLLocationDegrees(item.latitude), longitude: CLLocationDegrees(item.longitude))
//            coordinates.append(a)
//        }
        coordinates = (WalkManager.naviRoute?.routeCoordinates.map{
            return CLLocationCoordinate2D(latitude: CLLocationDegrees($0.latitude), longitude: CLLocationDegrees($0.longitude ))
            })!
        let polyline = MAPolyline(coordinates: &coordinates, count: UInt(coordinates.count))
        mapView.add(polyline)
        let walkMinute = (walkManager.naviRoute?.routeTime)! / 60
        let distance = walkManager.naviRoute?.routeLength
        var  timeDec = "1分钟以内"
        if walkMinute > 0{
            timeDec = walkMinute.description + "分钟"
        }
        let hinTitle = "步行" + timeDec
        let hinSubtitle = "距离" + (distance?.description)! + "米"
        
        FTIndicator.setIndicatorStyle(.dark)
        FTIndicator.showNotification(withTitle: hinTitle, message: hinSubtitle)
        
    }
    
    
}
