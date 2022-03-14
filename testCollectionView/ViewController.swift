//
//  ViewController.swift
//  testCollectionView
//
//  Created by user on 2021/12/09.
//

import UIKit
import Foundation

class ViewController: UIViewController {


    @IBOutlet weak var collectionView: UICollectionView!
    
    let numberInSection = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        switch indexPath.section {
        case 0:
            cell.backgroundColor = .blue
        case 1:
            cell.backgroundColor = .red
        case 2:
            cell.backgroundColor = .green
        case 3:
            cell.backgroundColor = .darkGray
        default:
            cell.backgroundColor = .black//不执行
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20 //2个item间距
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let padding = 20 * (numberInSection - 1)
        let availableWidth = Int(collectionView.bounds.size.width) - padding
        let width = availableWidth / numberInSection//一个cell宽度
        return CGSize(width: width, height: width)//返回一个cell的长宽
    }
    
}
