import Foundation

class DispatchQueueSerialQueue {
    let serialQueue = DispatchQueue(label: "com.example.serialQueue")
    var accountBalance = 1000

    func withdraw(amount: Int) {
        serialQueue.async {
            if self.accountBalance >= amount {
                // Simulate delay for demonstration purposes
                Thread.sleep(forTimeInterval: 1)
                self.accountBalance -= amount
                print("Withdrawal successful. Remaining balance: \(self.accountBalance)")
            } else {
                print("Insufficient funds")
            }
        }
    }

    func refillBalance(amount: Int) {
        serialQueue.async {
            // Simulate delay for demonstration purposes
            Thread.sleep(forTimeInterval: 1)
            self.accountBalance += amount
            print("Refill successful. Remaining balance: \(self.accountBalance)")
        }
    }

    func simulate() {
        for _ in 1...5 {
            withdraw(amount: 150)
            refillBalance(amount: 200)
        }
    }
    
}
