//
//  ViewController.swift
//  Food
//
//  Created by A_Z on 9/11/19.
//  Copyright © 2019 A_Z. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FoodList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.Image.image = UIImage(named: FoodList[indexPath.row].Iamge!)
        cell.Name.text = FoodList[indexPath.row].Name!
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowD", sender: FoodList[indexPath.row])
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dis=segue.destination as? ViewController2{
            if let Food=sender as? FoodItem{
                dis.SingleItem=Food
            }
        }
    }
    
var FoodList = Array<FoodItem>()
    @IBOutlet weak var CollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
      ReadforPList()
        
    }
    func ReadforPList() {
        let path = Bundle.main.path(forResource: "Foods", ofType: "plist")!
        let url = URL(fileURLWithPath: path)
        let data = try! Data(contentsOf: url)
        let plist = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)
        let dicArrary = plist as! [[String:String]]
        
        for dic in dicArrary {
            FoodList.append(FoodItem(Des: dic["Des"]!, Name: dic["Name"]!, Iamge: dic["Image"]!))        }
    }


}

