//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Egor on 07.02.2022.
//

import UIKit

class ResultsViewController: UIViewController {
    
    init?(coder: NSCoder, responces: [Answer]) {
        self.responces = responces
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet var resultAnswerLabel: UILabel!
    
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    var responces: [Answer]
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculatePersonalityResult()
        // Do any additional setup after loading the view.
    }
    
    func calculatePersonalityResult() {
        let frequencyOfAnswers = responces.reduce(into: [:]) {
            (counts, answer) in counts[answer.type, default: 0] += 1
        }
        let frequentAnswersSorted = frequencyOfAnswers.sorted(by: { (pair1,pair2) in
            return pair1.value > pair2.value
        })
        let mostCommonAnswer = frequentAnswersSorted.first!.key
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
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
