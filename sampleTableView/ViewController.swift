//
//  ViewController.swift
//  sampleTableView
//
//  Created by 三井 裕貴 on 2018/05/31.
//  Copyright © 2018年 三井 裕貴. All rights reserved.
//

import UIKit


var countryList = ["委内瑞拉","芬蘭","勃牙利","氷島"]




//１、プロトコルを設定
class ViewController: UIViewController
,UITableViewDelegate
,UITableViewDataSource{
    
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   
        
//        4,店長呼ぶのは私だ！！
        
        myTable.delegate = self
        myTable.dataSource = self
        

    }

    
    @IBOutlet weak var myTable: UITableView!
    
//    行数の設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryList.count
    }
    
//    表示する中身の設定　１業ごとのセルの設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        セルのインスタンス化　文字列を表示するCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cello", for: indexPath)
        
        cell.textLabel?.text = countryList[indexPath.row]
        
        
        
        return cell
    }
//    セルをタップしたら発動する。
    
    var selectedIndex:Int!  //選択された行番号を保存する為のもの
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath.row,"dao")
        selectedIndex = indexPath.row
        
//        セグえの名前を指定して画面遷移を発動
        performSegue(withIdentifier: "mitsui", sender: nil)
    }
    
//    セグウェイを使って画面遷移している時に発動（遷移中にやりたいことある時使う）
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        遷移先に情報を渡す処理
//        次の画面のインスタンスを生成
        let dvc:DetailViewController = segue.destination as! DetailViewController
        
//        次の画面のプロパティ　passsedindexに選択された行番号を渡す
        dvc.passedIndex = selectedIndex
        
    }
    
//    戻るボタン
    @IBAction func backToTop(segue: UIStoryboardSegue) {}
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

