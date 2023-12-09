//
//  OperationQueue.swift
//  SwiftLaba4
//
//  Created by Admin on 09/12/2023.
//  Copyright © 2023 Admin. All rights reserved.
//

import Foundation

var accountBalance = 1000

class WithdrawOperation: Operation {
    let amount: Int

    init(amount: Int) {
        self.amount = amount
        super.init()
    }

    override func main() {
        if accountBalance >= amount {
            // Simulate delay for demonstration purposes
            Thread.sleep(forTimeInterval: 1)
            accountBalance -= amount
            print("Withdrawal successful. Remaining balance: \(accountBalance)")
        } else {
            print("Insufficient funds")
        }
    }
}

class RefillOperation: Operation {
    let amount: Int

    init(amount: Int) {
        self.amount = amount
        super.init()
    }

    override func main() {
        Thread.sleep(forTimeInterval: 1)
        accountBalance += amount
        print("Refill successful. Remaining balance: \(accountBalance)")
    }
}

class OperationQueueRunner{
    let operationQueue = OperationQueue()
    
    func simulate() {
        // Simulate multiple withdrawals happening concurrently
        for _ in 1...5 {
            operationQueue.addOperation(WithdrawOperation(amount: 150))
            operationQueue.addOperation(RefillOperation(amount: 200))
        }

        operationQueue.waitUntilAllOperationsAreFinished()
    }
}
