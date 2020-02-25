//
//  ContentView.swift
//  WeSplit
//
//  Created by CSUFTitan on 1/31/20.
//  Copyright © 2020 sohadisi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = "";
    @State private var numOfPeople = 2;
    @State private var tipPercentage = 2;
    let tipPercentages = [10, 15, 20, 25, 0];
    var totalPerPerson: Double{
        let peopleCount = Double(numOfPeople + 2);
        let tipSelection = Double(tipPercentages[tipPercentage]);
        let orderAmount = Double(checkAmount) ?? 0;
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = tipValue + orderAmount;
        let amountPerPerson = grandTotal / peopleCount;
        return amountPerPerson
    }
    var body: some View {
        NavigationView{
            Form {
                Section{
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    Picker("Number of People", selection: $numOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("How much tip do you want to leave?")){
                    Picker("Tip Percentage", selection: $tipPercentage){
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])")
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
                }
                Section{
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
        .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
