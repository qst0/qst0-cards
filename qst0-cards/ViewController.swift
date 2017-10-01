//
//  ViewController.swift
//  qst0-cards
//
//  Created by qst0 on 9/30/17.
//  Copyright © 2017 qst0. All rights reserved.
//

import UIKit


// Random color generator from gist in bookmarks
func generateRandomColor() -> UIColor {
    let hue : CGFloat = CGFloat(arc4random() % 256) / 256 // use 256 to get full range from 0.0 to 1.0
    let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from white
    let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from black
    
    return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
}

//Extend int collections to have a randomElement function
extension Collection where Index == Int {
    func randomElement() -> Iterator.Element? {
        return isEmpty ? nil : self[Int(arc4random_uniform(UInt32(endIndex)))]
    }
}

var current_card = 0

let card_quotes = [
    "Learn a new skill.",
    "See setbacks as blimps, not catastrophes. You are human. Regularly work on feeling good about yourself, you'll be able to bounce back faster when you have a bad day.",
    "Do one thing you've been putting off, procrastination zap esteem",
    "Be prepared for new tasks: prepare in advance.",
    "I can forgive and understand others and their motives.",
    "Learn to enjoy your own company, take 10 mins alone.",
    "Exercise! It relaxes negative energy and releases endorhins, you will feel better!",
    "Just say \"yes\" to letting others help you! Even if you feel that you don't deserve it.",
    "Be yourself!!!",
    "I am free to choose to love as I wish and to give priority to my desires.",
    "Listen to others Talk, even if you feel unimportant!",
    "Cultivate friendships with people with high self-esteem (make good friends and good role models)",
    "Be honest with yourself and others, you will respect yourself more!",
    "Express your feelings\n•••\nassertively",
    "Get out of your comfort zone! Take a risk, move beyond what's safe.",
    "Affirm things, ideas, and people that are important to you!",
    "I have the power to change myself"
]

class ViewController: UIViewController {

    @IBOutlet weak var cardLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        cardLabel.text = card_quotes.randomElement()
        self.view.backgroundColor = generateRandomColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateCardQuote() {
        cardLabel.text = card_quotes[current_card]
        self.view.backgroundColor = generateRandomColor()
    }

    @IBAction func randomCardButton(_ sender: Any) {
        current_card = Int(arc4random_uniform(UInt32(card_quotes.count)))
        updateCardQuote()
    }
    
    @IBAction func nextCardButton(_ sender: Any) {
        current_card = (current_card + 1) % card_quotes.count
        updateCardQuote()
    }
    
}

