//
//  ViewController.swift
//  ViewTheme
//
//  Created by IPS-177  on 26/02/24.
//
import UIKit
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var headerview: UIView!
    @IBOutlet weak var tblview: UITableView!
    private let disposeBag = DisposeBag()
    
    var colorsArray = [UIColor.appRed1!,UIColor.appGreen1!,UIColor.appBlue1!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }


}
extension ViewController {
    func setupUI(){
        AppTheme.shared.appColor1Observable
            .compactMap { $0 } // Filter out nil values
            .subscribe(onNext: { [weak self] color in
                self?.titlelbl.textColor = color as! UIColor
                self?.headerview.backgroundColor = color
                self?.tblview.backgroundColor = color
            })
            .disposed(by: disposeBag)
    }
}


extension ViewController : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        var datasource = colorsArray[indexPath.row]
        cell.configure(color: datasource)
        cell.colorBtnPressedClosure = { [weak self] in
            AppTheme.shared.appThemeColor = datasource
            UserdefaultRepositoryManager.storeUserInfoFromUserdefault(type: .appColor, data: self?.storeAppColorInUserDefault(color : datasource)){ _ in}
        }
        return cell
    }
    
    private func storeAppColorInUserDefault(color:UIColor) -> String {
        switch color {
        case.appRed1!:
            return "appRed1"
        case.appGreen1!:
            return "appGreen1"
        case.appBlue1!:
            return "appBlue1"
        default:
            return "appBlue1"
        }
    }
    
}
