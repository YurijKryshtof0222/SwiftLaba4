import Foundation

class SemaphoreRunner {
    let concurrentQueue = DispatchQueue(label: "com.example.concurrentQueue", attributes: .concurrent)
    var accountBalance = 1000
    let semaphore = DispatchSemaphore(value: 1)

    func withdraw(amount: Int) {
        concurrentQueue.async {
            self.semaphore.wait()
            defer { self.semaphore.signal() }

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
        concurrentQueue.async {
            self.semaphore.wait()
            defer { self.semaphore.signal() }

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
