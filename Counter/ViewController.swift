//
//  ViewController.swift
//  Counter
//
//  Created by Анна Рыкунова on 25.04.2024.
//

import UIKit

class ViewController: UIViewController {

    private var counter: Int = 0 {
        didSet {
            counterLbl.text = "\(counter)"
        }
    }
    private var history: String = "История изменений:\n" {
        didSet {
            historyLbl.text = history
            let range = NSMakeRange(historyLbl.text.count - 1, 0)
            historyLbl.scrollRangeToVisible(range)
        }
    }
    private var time: String {
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy HH:mm"
        let someDateTime = formatter.string(from: currentDateTime)
        return "\(someDateTime)"
    }
    
    @IBOutlet weak var counterLbl: UILabel!
    @IBOutlet weak var plusOneBtn: UIButton!
    @IBOutlet weak var minusOneBtn: UIButton!
    @IBOutlet weak var clearBtn: UIButton!
    @IBOutlet weak var historyLbl: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyLbl.text = history
    }

    @IBAction func plusOne() {
        counter += 1
        history += "[\(time)]: значение изменено на +1\n"
    }
    
    @IBAction func minusOne() {
        if counter > 0 {
            counter -= 1
            history += "[\(time)]: значение изменено на -1\n"
        }
        else {
            history += "[\(time)]: попытка уменьшить значение счётчика ниже 0\n"
        }
    }
    
    @IBAction func clearCounter() {
        counter = 0
        history += "[\(time)]: значение сброшено\n"
    }
    
}

