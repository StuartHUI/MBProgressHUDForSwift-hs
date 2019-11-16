//
//  ViewController.swift
//  MBProgressHUDForSwift
//
//  Created by Shuai Hui on 2019/11/16.
//  Copyright © 2019 Shuai Hui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tableView = UITableView()
    var dataArr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        self.title = "MBProgressHUDDemo"
        // Do any additional setup after loading the view.
        self.tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height), style: .plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
        dataArr = ["showText","showTextToView","showTextafterDelay","showTextToViewafterDelay","showWaitMsg","showWait","showProgressTextToView","showProgress determinateHorizontalBar","showProgress annularDeterminate","showCustomProgressText"]
    }

}


extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell") as UITableViewCell
        }
        let string = dataArr[indexPath.row]
        
        cell?.textLabel?.text = string
        return cell ?? UITableViewCell.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let string = dataArr[indexPath.row]
        switch indexPath.row {
        case 0:
            MBProgressHUD.showText(string)
        case 1:
            MBProgressHUD.showText(string, toView: self.tableView)
        case 2:
            MBProgressHUD.showText(string, afterDelay: 2)
        case 3:
            MBProgressHUD.showText(string, toView: self.tableView, afterDelay: 2)
        case 4:
            MBProgressHUD.showWait(string)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(2 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) { () -> Void in
                MBProgressHUD.hideHUD()
            }
        case 5:
            MBProgressHUD.showWait()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(2 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) { () -> Void in
                MBProgressHUD.hideHUD()
            }
        case 6:
            let hud = MBProgressHUD.showProgressText(string, toView: self.view)
            DispatchQueue.global().async {
                var progress:Float = 0.0
                while (progress < 1.0){
                    progress += 0.01
                    DispatchQueue.main.async {
                        hud.progress = progress
                    }
                    // 进程挂起50毫秒
                    usleep(50000)
                }
                DispatchQueue.main.async {
                    hud.hide(true)
                }
            }
        case 7:
            let hud = MBProgressHUD.showProgressText(string, toView: self.view, model:.determinateHorizontalBar )
            DispatchQueue.global().async {
                var progress:Float = 0.0
                while (progress < 1.0){
                    progress += 0.01
                    DispatchQueue.main.async {
                        hud.progress = progress
                    }
                    // 进程挂起50毫秒
                    usleep(50000)
                }
                DispatchQueue.main.async {
                    hud.hide(true)
                }
            }
        case 8:
            let hud = MBProgressHUD.showProgressText(string, toView: self.view, model: .annularDeterminate)
            DispatchQueue.global().async {
                var progress:Float = 0.0
                while (progress < 1.0){
                    progress += 0.01
                    DispatchQueue.main.async {
                        hud.progress = progress
                    }
                    // 进程挂起50毫秒
                    usleep(50000)
                }
                DispatchQueue.main.async {
                    hud.hide(true)
                }
            }
        case 9:
            let imgView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            imgView.backgroundColor = .red
            let hud = MBProgressHUD.showCustomProgressText(string, toView: nil, custom: imgView)
            DispatchQueue.global().async {
                var progress:Float = 0.0
                while (progress < 1.0){
                    progress += 0.01
                    DispatchQueue.main.async {
                        hud.progress = progress
                    }
                    // 进程挂起50毫秒
                    usleep(50000)
                }
                DispatchQueue.main.async {
                    hud.hide(true)
                }
            }
        default:
            break
        }
        
        
    }
}

