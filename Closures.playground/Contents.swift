import UIKit

func applySalesTaxForState(state: String)->(Double)->Double{
    
    func applyTN(amount: Double)->Double{ return amount * 0.07 }
    
    func applyDE(amount: Double)->Double{ return 0 }
    
    func applyPA(amount: Double)->Double{ return amount * 0.06 }
    
    func applyGeneric(amount: Double)->Double{ return amount * 0.05 }
    
    if state == "TN"{
        return applyTN
    }
    else if state == "DE"{
        return applyDE
    }
    else if state == "PA"{
        return applyPA
    }
    else {
        return applyGeneric
    }
}

let taxForPA = applySalesTaxForState("PA")
let tax = taxForPA(100.0)
tax

let people = ["Jack Ryan", "Domingo Chavez",
    "Dominic Caruso", "Sam Fisher",
    "Jack Ryan, Jr.", "James Greer",
    "John Clark", "Kathleen Ryan",
    "Marko Ramius", "Scott Mitchell",
    "Robby Jackson", "Sally Ryan",
    "Sam Driscoll"]

//closure expression inline
let theJacksPart3 = people.filter{ $0.containsString("Jack") }
theJacksPart3


//closure expression passed to filter
let theRyans = people.filter({ (name:String)->Bool in
    return name.containsString("Ryan")
})

//closure expression omitting parameter and return types
let theJacks = people.filter({ (name) in
    return name.containsString("Jack")
})

//closure expression inline
let theJacksSimplified = people.filter({ name in name.containsString("Jack") })
theJacksSimplified

//closure expression inline
let theJacksPart2 = people.filter({ $0.containsString("Jack") })
theJacksPart2

