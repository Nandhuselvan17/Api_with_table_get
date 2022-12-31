//
//  ViewController.swift
//  soliderApi
//
//  Created by nschool on 02/11/22.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var jsonres = [String:Any]()
    var resApi = [[String:Any]]()
    @IBOutlet weak var SoliderTab: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.SoliderApi()
        self.SoliderTab.delegate = self
        self.SoliderTab.dataSource = self
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resApi.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let VC = tableView.dequeueReusableCell(withIdentifier: "soliderTableViewCell", for: indexPath) as! soliderTableViewCell
        VC.iDLB.text = "\(self.resApi[indexPath.row]["soc_id"]!)"
        VC.NameLb.text = "\(self.resApi[indexPath.row]["soc_name"]!)"
        VC.pressLb.text = "\(self.resApi[indexPath.row]["soc_pres"]!)"
        VC.managLb.text = "\(self.resApi[indexPath.row]["soc_manager"]!)"
        VC.extlLb.text = "\(self.resApi[indexPath.row]["soc_ext1"]!)"
        VC.phonelLb.text = "\(self.resApi[indexPath.row]["soc_phone1"]!)"
        VC.websiteLb.text = "\(self.resApi[indexPath.row]["soc_website"]!)"
        VC.cityCode.text = "\(self.resApi[indexPath.row]["cit_name"]!)"
        VC.conCode.text = "\(self.resApi[indexPath.row]["cit_code"]!)"
        
        let myImgURL = URL(string: "\("\(self.resApi[indexPath.row]["soc_image"]!)")")
        let myData = NSData(contentsOf: myImgURL!)
        VC.socityImg.image = .init(data: myData! as Data)
        
        let myImg = URL(string: "\("\(self.resApi[indexPath.row]["cou_image"]!)")")
        let myDim = NSData(contentsOf: myImg!)
        VC.conImg.image = .init(data: myDim! as Data)
        
        return VC
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1000
    }
    
    //function Call
    func SoliderApi(){
        let myUrl = URL(string: "http://www.elitedoctorsonline.com/api_mob/browser/society/slider.aspx?lang=en")
        var urlReq = URLRequest(url: myUrl!)
        urlReq.httpMethod = "GET"
    
        let test = URLSession.shared.dataTask(with: urlReq) { data, response, error in
            if let err = error{
                print(err)
            }
            if let resp = response as? HTTPURLResponse{
                print(resp.statusCode)
            }
            do{
                self.jsonres = try JSONSerialization.jsonObject(with: data!) as! [String : Any]
                self.resApi = self.jsonres["slider_data"] as! [[String : Any]]
                print(self.jsonres)
            }
            catch let err as NSError{
                print(err.localizedDescription)
            }
            DispatchQueue.main.async {
                self.SoliderTab.reloadData()
            }
        }
        test.resume()
    }

}

