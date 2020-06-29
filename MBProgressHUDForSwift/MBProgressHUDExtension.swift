//
//  MBProgressHUDExtension.swift
//  MBProgressHUDForSwift
//
//  Created by Shuai Hui on 2019/11/16.
//  Copyright © 2019 Shuai Hui. All rights reserved.
//

import Foundation

import UIKit

extension MBProgressHUD{
    
    /// 自动消失提示
    ///
    /// - Parameters:
    ///   - text: 要显示的文字
    ///   - toView: 要添加的View
    ///   - afterDelay: 停留时间
    class func showText(_ text:String, toView:UIView? = nil, afterDelay:TimeInterval = 1){
        if text == "" {
            return
        }
        var view = toView
        if view == nil {
            view = UIApplication.shared.windows.last
        }
        var hud = MBProgressHUD.HUDForView(view!)
        if hud == nil {
            hud = MBProgressHUD.showHUDAddedTo(view!, animated: true)
        }
        // Configure for text only and offset down
        hud!.mode = .text
        hud!.labelText = text
        //        hud.margin = 10.0 //默认20  改为10会变窄
        hud!.removeFromSuperViewOnHide = true
        
        hud!.hide(true, afterDelay: afterDelay)
    }

//    class func showWait(_ message:String?)->MBProgressHUD{
    
    /// 不自动消失 文字+菊花提示
    ///
    /// - Parameter message: 文字
    class func showWait(_ message:String? = nil){
        let view = UIApplication.shared.windows.last
        let hud: MBProgressHUD = MBProgressHUD.showHUDAddedTo(view!, animated: true)
        hud.labelText = message
        hud.removeFromSuperViewOnHide = true
        hud.show(true)
//        return hud
    }

    class func hideHUDForView(_ forView:UIView?){
        var view = forView
        if view == nil {
            view = UIApplication.shared.windows.last
        }
//        _ = self.hideHUDForView(view!, animated: true)
        _ = self.hideHUDForView(view!, animated: true)
    }
    class func hideHUD(){
        MBProgressHUD.hideHUDForView(nil)
    }
    
    /// 文字+进度提示 默认扇形
    ///
    /// - Parameters:
    ///   - text: text
    ///   - toView: toView
    ///   - model: 进度条样式（determinate、determinateHorizontalBar、annularDeterminate ）
    /// - Returns: hud对象 可设置progress 控制消失
    class func showProgressText(_ text:String, toView:UIView?, model:MBProgressHUDMode = .determinate)->MBProgressHUD {
        var view = toView
        if view == nil {
            view = UIApplication.shared.windows.last
        }
        var hud = MBProgressHUD.HUDForView(view!)
        if hud == nil {
            hud = MBProgressHUD.showHUDAddedTo(view!, animated: true)
        }
        // Configure for text only and offset down
        hud!.mode = model
        hud!.labelText = text
        //        hud.margin = 10.0 //默认20  改为10会变窄
        hud!.removeFromSuperViewOnHide = true
        
        hud!.show(true)
        return hud!
    }
    
    /// 自定义 不自动消失
    ///
    /// - Parameters:
    ///   - custom: 自定义view 在文字之上
    class func showCustomProgressText(_ text:String, toView:UIView?, custom:UIView)->MBProgressHUD {
        var view = toView
        if view == nil {
            view = UIApplication.shared.windows.last
        }
        var hud = MBProgressHUD.HUDForView(view!)
        if hud == nil {
            hud = MBProgressHUD.showHUDAddedTo(view!, animated: true)
        }
        hud?.customView = custom
        // Configure for text only and offset down
        hud!.mode = .customView
        hud!.labelText = text
        //        hud.margin = 10.0 //默认20  改为10会变窄
        hud!.removeFromSuperViewOnHide = true
        
        hud!.show(true)
        return hud!
    }
}
