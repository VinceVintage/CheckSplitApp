//
//  ContentView.swift
//  SwiftUI Project 1
//
//  Created by Nathan Vasquez on 5/30/21.
//



import SwiftUI

struct ContentView: View {
    
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelction = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelction
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var totalOnTheBill: Double {
        let billTotal = Double(checkAmount) ?? 0
        let tipTotal = Double(tipPercentages[tipPercentage])
        
        let FinalTotal = billTotal / 100 * tipTotal
        let finalfinaltotal = FinalTotal + billTotal
       
        
        return finalfinaltotal
    }
    
    
        
    

    var body: some View {
        NavigationView {
        Form {
           

            Section {

                TextField("Amount", text: $checkAmount).keyboardType(.decimalPad)
                Section {
                    Text("Tip Percentage ")
                        .font(.callout)
                        
                    
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                                .font(.headline)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

        
           
                
                Picker("Total People", selection: $numberOfPeople) {
                    ForEach(2 ..< 100) {
                        Text("\($0) People")
                        }
                  

                    }
                }
            
            Section {
                Text("Amount Per Person")
                    .font(.footnote)
                Text("$\(totalPerPerson, specifier: "%.2f")")

            }
            Section {
                Text("Total Bill + Tip")
                    .font(.largeTitle)
                Text("$\(totalOnTheBill, specifier: "%.2f")")
            }
            }
        .navigationTitle("Boo's Split App")
        }
    }
        
}
    
        
    

 

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
