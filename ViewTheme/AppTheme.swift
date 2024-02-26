//
//  AppTheme.swift
//  X-Lab
//
//  Created by IPS-161 on 15/02/24.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

public final class AppTheme {
    
    static let shared = AppTheme()
    init() {
        if let appColor = UserdefaultRepositoryManager.fetchUserInfoFromUserdefault(type: .appColor) {
            appThemeColor = getAppColor(appColor: appColor)
        } else {
            appThemeColor = UIColor.appBlue1!
            UserdefaultRepositoryManager.storeUserInfoFromUserdefault(type: .appColor, data: "appBlue1") { _ in }
        }
        appColor1Relay.accept(processColorsForAppColor1(color: appThemeColor!))
     
    }

    private let appColor1Relay = BehaviorRelay<UIColor?>(value: UIColor.appBlue1)

    var appThemeColor : UIColor? {
        willSet(newValue){
            appColor1 = newValue

        }
    }
    
    var appColor1Observable: Observable<UIColor?> {
        return appColor1Relay.asObservable()
    }

    
    var appColor1: UIColor? {
        get {
            return appColor1Relay.value
        }
        set {
            appColor1Relay.accept(processColorsForAppColor1(color: newValue!))
        }
    }
    
    private func processColorsForAppColor1(color:UIColor) -> UIColor {
        switch color {
        case.appRed1!:
            return UIColor.appRed1!
        case.appGreen1!:
            return UIColor.appGreen1!
        case.appBlue1!:
            return UIColor.appBlue1!
        default:
            return UIColor.black
        }
    }

    private func getAppColor(appColor: String) -> UIColor {
        switch appColor {
        case "appRed1":
            return UIColor.appRed1!
        case "appGreen1":
            return UIColor.appGreen1!
        case "appBlue1":
            return UIColor.appBlue1!
        default:
            return UIColor.appBlue1!
        }
    }
    
}
