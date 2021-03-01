//
//  showCardViewController.swift
//  soreseikai
//
//  Created by 伊藤愛結 on 2021/02/26.
//

import UIKit
import CoreMotion

class showCardViewController: UIViewController {
    
    var people: Int!
    var name = [String]()
    var answer = [String]()
    
    var answerLabel: [UILabel] = []
    
    let centerWidth = UIScreen.main.bounds.size.width / 2
    let centerHeight = UIScreen.main.bounds.size.height / 2
    
    var locationX: [Float] = []
    var locationY: [Float] = []
    
    let r = UIScreen.main.bounds.size.width / 3
    
    let ball = UIImageView(image: UIImage(named: "awa.png"))
    
    let motionManager = CMMotionManager()
    var accelerationX: Double = 0.0
    var accelerationY: Double = 0.0
    
    var dummyBallX: Double = 0.0
    var dummyBallY: Double = 0.0
    
    var dummyBallAngle: Double = 0.0
    
    var ballX: Double = 0.0
    var ballY: Double = 0.0
    
    var alphabetId: Int!
    var odaiId: Int!
    
    var finalAnswer: String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        //円
        
        let grayPath = UIBezierPath()
        grayPath.addArc(withCenter: CGPoint(x: centerWidth, y: centerHeight), // 中心
                     radius: r, // 半径
                     startAngle: 0, // 開始角度
                     endAngle: .pi * 2.0, // 終了角度
                     clockwise: true) // 時計回り

        let grayLayer = CAShapeLayer()
        grayLayer.path = grayPath.cgPath
        grayLayer.fillColor = UIColor.clear.cgColor // 塗り色
        grayLayer.strokeColor = UIColor(red: 0.80, green: 0.80, blue: 0.80, alpha: 1.0).cgColor // 線の色
        grayLayer.lineWidth = 10.0 // 線の幅
        self.view.layer.addSublayer(grayLayer)
       
        
        
        //カード

        for i in 0 ..< people{
            let card = UILabel()
            let angle = CGFloat.pi / 180.0  * ((360 / CGFloat(people)) * CGFloat(i))
            - CGFloat.pi / 180.0 * 90.0
            let x = r * cos(CGFloat(angle)) + centerWidth - 60
            let y = r * sin(CGFloat(angle)) + centerHeight - 30
            locationX.append(Float(x))
            locationY.append(Float(y))
            card.frame = CGRect(x: x,y: y,width: 120,height: 60)
            card.text = answer[i]
            card.font = UIFont.systemFont(ofSize: 20.0)
            card.textAlignment = NSTextAlignment.center
            card.adjustsFontSizeToFitWidth = true
            card.backgroundColor = UIColor.red
            answerLabel.append(card)
        }
        
        for card in answerLabel{
            view.addSubview(card)
        }
        
        
        
        
        
        //ボール
        
        ball.frame = CGRect(x: centerWidth - 50, y: centerHeight - r - 50, width: 100, height: 100)
        view.addSubview(ball)
        
//        let dummyBall = UIImageView(image: UIImage(named: "awa.png"))
//        dummyBall.frame = CGRect(x: centerWidth - 50, y: centerHeight - r - 50, width: 100, height: 100)
        

        if motionManager.isAccelerometerAvailable{
            motionManager.accelerometerUpdateInterval = 0.01
            motionManager.startAccelerometerUpdates(to: OperationQueue.current!){ data , error in

                self.accelerationX = (data?.acceleration.x)!
                self.accelerationY = (data?.acceleration.y)!
                
//                dummyBall.center.x += CGFloat(self.accelerationX)
//                dummyBall.center.y -= CGFloat(self.accelerationY)
//
//                self.dummyBallX = Double(dummyBall.center.x)
//                self.dummyBallY = Double(dummyBall.center.y)
//                print(self.dummyBallX)
                
//                self.dummyBallAngle = atan2(self.dummyBallY - Double(self.centerHeight), self.dummyBallX - Double(self.centerHeight))
//                print(self.dummyBallAngle)
                
//                ball.center.x = CGFloat(Double(self.r) * cos(self.dummyBallAngle))
//                ball.center.y = CGFloat(Double(self.r) * sin(self.dummyBallAngle))
                
                self.ball.center.x += CGFloat(self.accelerationX)
                self.ball.center.y -= CGFloat(self.accelerationY)
                
                
                
                
                if self.ball.frame.origin.x > self.centerWidth + self.r - 50{
                    self.ball.frame.origin.x = self.centerWidth + self.r - 50
                }else if self.ball.frame.origin.x < self.centerWidth - self.r - 50{
                    self.ball.frame.origin.x = self.centerWidth - self.r - 50
                }

                if self.ball.frame.origin.y > self.centerHeight + self.r - 50{
                    self.ball.frame.origin.y = self.centerHeight + self.r - 50
                }else if self.ball.frame.origin.y < self.centerHeight - self.r - 50{
                    self.ball.frame.origin.y = self.centerHeight - self.r - 50
                }
                
                

                

            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResult"{
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.alphabetId = self.alphabetId
            resultViewController.odaiId = self.odaiId
            resultViewController.answer = self.finalAnswer
        }
    }
    
    @IBAction func chooseAnswer(){
        for i in 0 ..< people{
            if ball.center.x >= CGFloat(locationX[i]) && ball.center.x <= CGFloat(locationX[i]) + 100 && ball.center.y >= CGFloat(locationY[i]) && ball.center.y <= CGFloat(locationY[i]) + 100 {
                finalAnswer = answer[i]
                if finalAnswer == nil{
                    //アラート
                }else{
                    self.performSegue(withIdentifier: "toResult", sender: nil)
                }
            }
        }
    }

}
