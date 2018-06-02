//
//  DetailViewController.swift
//  sampleTableView
//
//  Created by 三井 裕貴 on 2018/06/01.
//  Copyright © 2018年 三井 裕貴. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox
var vibrationCount = 5

class DetailViewController: UIViewController {

    @IBOutlet weak var myLavel: UILabel!
    
    @IBOutlet weak var imagrView: UIImageView!
    
    @IBOutlet weak var textFild: UITextField!
    @IBOutlet weak var myLavel2: UILabel!
    @IBOutlet weak var myLavel3: UILabel!
    
     var audioPlayer : AVAudioPlayer!
    
//    受け取った配列のインデックス番号＝行が入る予定の変数（絶対存在しない値を入れてる）
    var passedIndex = -1  //nilのままだったら受け取ってない証拠とする為に初期設定している。
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        myLavel.text = countryList[passedIndex]
        
        if countryList[passedIndex] == "委内瑞拉"{
            myLavel.text = "ベネズエラ"
            myLavel2.text = "首都はどこ？？"
            
            imagrView.image = UIImage(named: "ve.jpg")
            
        }else if countryList[passedIndex] == "芬蘭"{
            myLavel.text = "フィンランド"
            myLavel2.text = "漢字で書くと？"
            imagrView.image = UIImage(named: "f.jpg")
            
        }else if countryList[passedIndex] == "勃牙利"{
            myLavel.text = "ブルガリア"
            myLavel2.text = "首都は？"
            imagrView.image = UIImage(named: "bg.jpg")
            
        }else if countryList[passedIndex] == "氷島"{
            myLavel.text = "アイスランド"
            myLavel2.text = "アイスランドはさむ...?"
            imagrView.image = UIImage(named: "is.jpg")
        }
        
        textFild.placeholder = "入力してください"
        
        
        
    }
    
    
    @IBAction func answer(_ sender: UITextField) {
        if sender.text! == "カラカス"{
            myLavel3.text = "正解"
            playSound()
            
        }else if sender.text! == "芬蘭" {
            myLavel3.text = "正解"
            playSound()
            
        }else if sender.text! == "ソフィア"{
            myLavel3.text = "正解"
            playSound()
            
        }else if sender.text! == "い"{
            myLavel3.text = "正解"
            playSound()
            
        }else{
            myLavel3.text = "ざんねん"
            playSound1()
            startVibrateInterval()
        }
    }
    
//    正解音
    func playSound(){
        
        if let url = Bundle.main.url(forResource: "correct", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
                
            } catch {
                // プレイヤー作成失敗
                // その場合は、プレイヤーをnilとする
                audioPlayer = nil
            }
            
        } else {
            // urlがnilなので再生できない
            fatalError("Url is nil.")
        }
        
    }
    
//    爆発音
    func playSound1(){
        
        if let url = Bundle.main.url(forResource: "wrong", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
                
            } catch {
                // プレイヤー作成失敗
                // その場合は、プレイヤーをnilとする
                audioPlayer = nil
            }
            
        } else {
            // urlがnilなので再生できない
            fatalError("Url is nil.")
        }
        
    }
    
//    バイブレーター
    func vibrate() {
        AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
    
    func startVibrateInterval() {
        
        // どのバイブレーションを鳴らすか
        let systemSoundID = SystemSoundID(kSystemSoundID_Vibrate)
        
        // 繰り返し用のコールバックをセット
        AudioServicesAddSystemSoundCompletion(systemSoundID, nil, nil, { (systemSoundID, nil) -> Void in
            
            //vibrationCount =  vibrationCount - 1
            
            if ( vibrationCount > 0 ) {
                // 繰り返し再生
                AudioServicesPlaySystemSound(systemSoundID)
            }
            else {
                // コールバックを解除
                AudioServicesRemoveSystemSoundCompletion(systemSoundID)
            }
            
        }, nil)
        
        // 初回のバイブレーションを鳴らす
        AudioServicesPlaySystemSound(systemSoundID)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
