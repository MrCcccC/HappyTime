//
//  HomeTableViewCell.swift
//  weibo
//
//  Created by 5201-mac on 2017/4/10.
//  Copyright © 2017年 5201-mac. All rights reserved.
//

import UIKit
import SDWebImage
 var Image:UIImage=UIImage()
class HomeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var desc: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//    func setNews(Item:tableViewItem){
//                var newsItem = Item
//                self.timelabel?.text = newsItem.newsTime
//                self.titlelabel?.text = newsItem.newsTitle
//                //self.typelabel?.text = newsItem.newsType
//                self.titlelabel?.sizeToFit()
//                self.titlelabel?.numberOfLines = 0
//        
//    }
    var news:tableViewItem?{
        didSet{
            title.text = news?.Title
            time.text = news?.Time
            desc.text = news?.Description
            desc.numberOfLines = 4
            //self.loadImg(url: (news?.ImgURL)!)
            DispatchQueue.global().async {
                 let url = NSURL(string: (self.news?.ImgURL)!)
                 let  model = UIImageView()
                model.sd_setImage(with: url as URL?)
                DispatchQueue.main.async(execute: { 
                    self.img.image = model.image
                })
            }
           
            
            
        }
    }
//    func loadImg(url:String){
//        DispatchQueue.global().async {
//            let URL = NSURL(string: url, relativeTo: NSURL(string: url) as URL?)
//            let img = NSData(contentsOf: URL as! URL)
//            Image = UIImage(data: img as! Data)!
//                       }
//        DispatchQueue.main.async {
//        self.img.image = Image
//                   }
//
//    }

}
