//
//  HappyTableViewCell.swift
//  每日一乐
//
//  Created by 5201-mac on 2017/4/12.
//  Copyright © 2017年 5201-mac. All rights reserved.
//

import UIKit

class HappyTableViewCell: UITableViewCell {

    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var conteneLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    func heightForCell(status:Happytable)->(CGFloat){
        //设置数据
        self.news = status
        //刷新布局
        self.layoutIfNeeded()
        //返回最最下方控件的最大Y值，就是高度啦
        return  time.frame.maxY + CGFloat(10)
    }

    var news:Happytable?{
        didSet{
           conteneLable.text = news!.content
            time.text = news?.updatetime
            conteneLable.numberOfLines = 0
            conteneLable.sizeToFit()
            time.font=UIFont.systemFont(ofSize: 11)
            layoutIfNeeded()
            var cellHeight = time.frame.maxY + CGFloat(5)
            news?.cellHeight = cellHeight
        }
    }
    
}
