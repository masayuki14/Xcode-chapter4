//
//  ViewController.swift
//  chapter4
//
//  Created by 森崎雅之 on 2016/01/30.
//  Copyright © 2016年 Masayuki Morisaki. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    let randomSource = GKRandomSource()
    
    @IBOutlet weak var computerImageView: UIImageView!
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let angle:CGFloat = CGFloat(M_PI) // ラジアン180度
        computerImageView.transform = CGAffineTransformMakeRotation(angle) // ラジアンだけ回転
    }

    @IBAction func tapStart() {
        
        // 両者グー表示
        computerImageView.image = UIImage(named: "goo.png")
        playerImageView.image = UIImage(named: "goo.png")
        
        messageLabel.text = "じゃんけんするYO!!"
    }
    
    @IBAction func tapGoo() {
        playerImageView.image = UIImage(named: "goo.png")
        let com = doComputer()
        judge(0, computer: com)
    }
    
    @IBAction func tapChoki() {
        playerImageView.image = UIImage(named: "choki.png")
        let com = doComputer()
        judge(1, computer: com)
    }
    
    @IBAction func tapPaa() {
        playerImageView.image = UIImage(named: "paa.png")
        let com = doComputer()
        judge(2, computer: com)
    }
    
    func doComputer() -> Int {
        // computer playing method.
        let computer = randomSource.nextIntWithUpperBound(3)
        switch computer {
        case 0:
            computerImageView.image = UIImage(named: "goo.png")
        case 1:
            computerImageView.image = UIImage(named: "choki.png")
        case 2:
            computerImageView.image = UIImage(named: "paa.png")
        default:
            break
        }
        
        return computer
    }
    
    func judge(player: Int, computer: Int) {
        if (player == computer) {
            messageLabel.text = "あいこ。"
        } else if (player == 0 && computer == 1
                || player == 1 && computer == 2
                || player == 2 && computer == 0) {
            messageLabel.text = "勝ち!!やったNe!!"
        } else {
            messageLabel.text = "負け... クソが。"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

