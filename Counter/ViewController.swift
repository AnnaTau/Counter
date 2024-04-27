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
            counterLabel.text = "\(counter)"
        }
    }
    private var history: String = "История изменений:\n" {
        didSet {
            historyLabel.text = history
            let range = NSMakeRange(historyLabel.text.count - 1, 0)
            historyLabel.scrollRangeToVisible(range)
        }
    }
    private var time: String {
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy HH:mm"
        let someDateTime = formatter.string(from: currentDateTime)
        return "\(someDateTime)"
    }
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var plusOneButton: UIButton!
    @IBOutlet private weak var minusOneButton: UIButton!
    @IBOutlet private weak var cleanButton: UIButton!
    @IBOutlet private weak var historyLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyLabel.text = history
    }
    
    @IBAction private func plusOne() {
        counter += 1
        history += "[\(time)]: значение изменено на +1\n"
    }
    
    @IBAction private func minusOne() {
        if counter > 0 {
            counter -= 1
            history += "[\(time)]: значение изменено на -1\n"
        }
        else {
            history += "[\(time)]: попытка уменьшить значение счётчика ниже 0\n"
        }
    }
    
    @IBAction private func clearCounter() {
        counter = 0
        history += "[\(time)]: значение сброшено\n"
    }
}

