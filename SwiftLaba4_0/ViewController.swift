//
//  ViewController.swift
//  SwiftLaba4_0
//
//  Created by Admin on 09/12/2023.
//  Copyright © 2023 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        let dispatchQueueConcurentRunner = DispatchQueueConcurentRunner()
        let dispatchQueueSerialQueue = DispatchQueueSerialQueue()
        let operationQueueRunner = OperationQueueRunner()
        let semaphore = SemaphoreRunner()

//        print("hello")

        semaphore.simulate()
    }


}

