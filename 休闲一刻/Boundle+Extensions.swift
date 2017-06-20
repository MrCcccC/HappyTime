//
//  Boundle+Extensions.swift
//  trainingforswift
//
//  Created by 5201-mac on 2017/3/28.
//  Copyright © 2017年 5201-mac. All rights reserved.
//

import Foundation

extension Bundle{
    
    var namespace : String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
