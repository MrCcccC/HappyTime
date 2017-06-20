//
//  ViewController.swift
//  休闲一刻
//
//  Created by 5201-mac on 2017/6/7.
//  Copyright © 2017年 5201-mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var submitBtn: UIButton!
    var i = 5
    var timer : Timer? //创建一个定时器
    
    
    
    @IBAction func submit(_ sender: Any) {
        
        let vc = MainViewController()
        self.present(vc, animated: true, completion: nil)
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupTimer()
    }
    
    //改变button的标题
    func updateTitle(){
        self.submitBtn.setTitle("\(i)跳过", for: .normal)
        self.submitBtn.setTitleColor(#colorLiteral(red: 0.4937108383, green: 0.5909212771, blue: 1, alpha: 1), for: .normal)
        self.i -= 1
        if self.i<0 {
            timer?.invalidate()
            let vc = MainViewController()
            self.present(vc, animated: true, completion: nil)
        }
        
    }
    
    //创建定时器
    func SetupTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(updateTitle),
                                     userInfo: nil,
                                     repeats: true)
        RunLoop.current.add(timer!, forMode: RunLoopMode.commonModes)
    }
    
    

}

