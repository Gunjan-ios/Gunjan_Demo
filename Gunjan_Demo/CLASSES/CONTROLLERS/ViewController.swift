//
//  ViewController.swift
//  Gunjan_Demo
//

import UIKit
import SwiftyJSON
import MaterialComponents

class ViewController: ParentClass {


    @IBOutlet weak var tblList: UITableView!
    var listData : [Article] = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblList.delegate = self
        tblList.dataSource = self        
        tblList.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "ListTableViewCell")
        tblList.separatorStyle = .none
        tblList.backgroundColor = .systemGray6
        self.tblList.estimatedRowHeight = UITableView.automaticDimension
        
        let data = getFromUserDefaultForKeyByUnArchive(key_dataSave)
        if data != nil{
            listData = data!
            listData.count > 0 ? tblList.reloadData() :  self.showBanner(title: "Alert", subTitle: CS.Common.NoData , style: .danger, vc: self)
        }else{
            getListAPI()

        }
    }



//MARK: - API FUNCATION

    func getListAPI() {

        APIManager.callAPIGetRequest(Method: .get, url: "\(BASE_URL)\(API_KEY)", parameters: nil, headers: const_HeaderWithToken, showAlert: true, withloader:true, viewContoller: self , completion: { [self] (DATA, message) in
            
            let status = DATA["status"].stringValue
            
            if status == "ok"{
                DATA["articles"].arrayValue.forEach{ item in
                    let value = Article.init(fromJson: item)
                    listData.append(value)
                }
                setToUserDefaultForKeyByArchive(listData, key: key_dataSave)

                listData.count > 0 ? tblList.reloadData() :  self.showBanner(title: "Alert", subTitle: CS.Common.NoData , style: .danger, vc: self)
            }else{
                self.showBanner(title: "Alert", subTitle: CS.Common.defaultFailedMessage , style: .danger, vc: self)
            }
    
        }) { (response, errorMessage) in
            self.showBanner(title: "Alert", subTitle: errorMessage , style: .danger, vc: self)
        }
    }


}

//MARK:- Tablew View Delegate
extension ViewController : UITableViewDelegate,UITableViewDataSource{
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tblList.dequeueReusableCell(withIdentifier: String(describing: ListTableViewCell.self)) as! ListTableViewCell

        let dic = listData[indexPath.row]
        cell.author.text = dic.author
        cell.date.text = Utils.convertDateFormat(inputDate: dic.publishedAt)
//        cell.date.text = self.getDate(date: dic.publishedAt)
//        cell.date.text = dic.publishedAt
        cell.title.text = dic.title
        cell.newsLink.setTitle(dic.url, for: .normal)
        cell.newsLink.tag = indexPath.row
        cell.newsLink.addTarget(self, action: #selector(urlLinkPressed(sender:)), for: .touchUpInside)
        cell.imgView.sd_setImage(with: URL (string: dic.urlToImage), placeholderImage: UIImage (named: "placeHolder"), options: .progressiveLoad, progress: nil, completed: nil)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = self.storyboard?.instantiateViewController(identifier: CS.Identifiers.DetailViewController) as? DetailViewController
        vc?.articalData = listData[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    @objc func urlLinkPressed(sender : UIButton){
        let newVC = self.storyboard?.instantiateViewController(identifier: CS.Identifiers.NewsViewController) as? NewsViewController
        newVC?.strUrl  = listData[sender.tag].url
        self.navigationController?.pushViewController(newVC!, animated: true)
        
    }
}
