//: Playground - noun: a place where people can play

import UIKit

public struct PennyShaver{
    public static var stolenSoFar = 0.0
    public static var numberofPeopleStolenFrom = 0
    var amountToSteal = 0.01
    
    public func createPaymentCalculator(withOverTime: Bool) -> (Double, Double)->Double{
        func calculatePayrollFor(hourlyRate: Double, hours: Double)->Double {
            let undroundedPayrollAmount = hourlyRate * hours
            
            PennyShaver.stolenSoFar += amountToSteal
            PennyShaver.numberofPeopleStolenFrom++
            
            return undroundedPayrollAmount - amountToSteal
        }
        
        func calculatePayrollWithOverTime(hourlyRate: Double, hours: Double)->Double{
            let overtimeHours = hours - 40
            let overtimeRate = hourlyRate * 1.5
            
            var undroundedPayrollAmount = hourlyRate *  40
            let overTimePay = overtimeHours * overtimeRate
            undroundedPayrollAmount += overTimePay
            
            PennyShaver.stolenSoFar += amountToSteal
            PennyShaver.numberofPeopleStolenFrom++
            
            return undroundedPayrollAmount - amountToSteal
        }
        
        if withOverTime{
            return calculatePayrollWithOverTime
        }
        else{
            return calculatePayrollFor
        }
    }
}

var pennyShaver = PennyShaver(amountToSteal: 0.10)
let overtimeCalculator = pennyShaver.createPaymentCalculator(true)
let regtimeCalculator = pennyShaver.createPaymentCalculator(false)
let overTimePay = overtimeCalculator(83.33, 46.25)

for _ in 0...50{
    let randHoursWorked = Double(arc4random_uniform(6000)) / 100.0
    let randSalary = max(30.0, Double(arc4random_uniform(16000)) / 100)
    
    if randHoursWorked > 40.0{
        overtimeCalculator(randSalary, randHoursWorked)
    }
    else{
        regtimeCalculator(randSalary, randHoursWorked)
    }
}

PennyShaver.stolenSoFar
PennyShaver.numberofPeopleStolenFrom



// escaping closure example
func updateServerCall(completion:(Bool, String?)->Void){
    // do some work and then notify the caller that we are done by calling the completion handler
    completion(true, "everything worked fine, bro")
}

// passing a closure expression
updateServerCall { (status, message) -> Void in
    if status {
        print("success:\(message!)")
    }
}

//create list to hold callback closures
var callbackListenerList: [(Bool, String)->Void] = []

func registerListenerCallbacks(callback: (Bool, String?)->Void){
    //add new listeners to the list
    // because we add this callback to a list that can be called later,
    // we have to have an escaping closure
    callbackListenerList.append(callback)
}

// add several callbacks to our list to be accessed later
for cnt in 0...3{
    registerListenerCallbacks({ (_, message) -> Void in
        print("message-\(cnt): \(message!)")
    })
}

//grab the first closure in the list and call it
callbackListenerList.count
let cb1 = callbackListenerList.first!
cb1(true, "Yea Man, it's all good")


func registerListenerCallbacksNonEscaping(@noescape callback: (Bool, String?)->Void){
    //add new listeners to the list
    // because we add this callback to a list that can be called later,
    // we have to have an escaping closure
    callbackListenerList.append(callback)
}



