//
//  DetailViewController.swift
//  Gunjan_Demo
//
//  Created by Harsh Purohit on 27.09.21.
//

import UIKit

class DetailViewController: ParentClass {

    @IBOutlet weak var scrlView: UIScrollView!
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var descripton: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var date: UILabel!
    
    var articalData : Article!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()

        // Do any additional setup after loading the view.
    }

    func setupData() {
        titleName.text = articalData.title
        descripton.text = articalData.descriptionField
        imgView.sd_setImage(with: URL (string: articalData.urlToImage), placeholderImage: UIImage (named: "placeHolder"), options: .progressiveLoad, progress: nil, completed: nil)
        content.text = articalData.content
        author.text = articalData.author
        date.text = articalData.publishedAt

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
