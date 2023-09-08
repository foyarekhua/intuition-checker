//
//  ContentView.swift
//  Intuition checker
//
//  Created by Fatimah-Aliyah Oyarekhua on 2023-08-25.
//

import SwiftUI

struct winnerView: View{
    var body: some View {
        VStack{
            Spacer()
            Image(systemName: "checkmark.rectangle.portrait")
                .resizable()
                .foregroundColor(.green)
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 44.0)
                // TODO animation
            Spacer()
        }
        .ignoresSafeArea()
        .background(.black)
    }
}

struct loserView: View{
    var body: some View {
        VStack{
            Spacer()
            Image(systemName: "x.square")
                .resizable()
                .foregroundColor(.red)
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 44.0)
                // TODO animation
            Spacer()
        }
        .ignoresSafeArea()
        .background(.black)
    }
}

struct ContentView: View {
    @State var showresults = false
    @State var choiceColour : Int = -1
    
    
    var body: some View {
        var trueColour : Int = setColour()
        ZStack {
            // choose colour
            VStack(alignment: .center) {
                // TODO change font
                Text("Which colour is behind the question mark?")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding()
                Image(systemName: "questionmark.square")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding([.leading, .bottom, .trailing], 40.0)


                // choose colour
                HStack(spacing: 0.0) {
                    VStack {
                        // red button
                        Button {
                            if (!showresults){
                                tapButton(colour: 1)
                                showresults = true
                            }
                            
                        } label: {
                            Image(systemName: "square.fill")
                                .resizable()
                                .foregroundColor(.red)
                                .padding([.top, .trailing])
                        }
                        
                        Button{
                            if (!showresults){
                                tapButton(colour: 2)
                                showresults = true
                            }
                        } label: {
                            Image(systemName: "square.fill")
                                .resizable()
                                .foregroundColor(.blue)
                                .padding([.top, .trailing])
                        }
                    }
                    .padding(.leading)

                    VStack {
                        Button{
                            if (!showresults){
                                tapButton(colour: 3)
                                showresults = true
                            }
                        } label: {
                            Image(systemName: "square.fill")
                                .resizable()
                                .foregroundColor(.green)
                                .padding([.top, .leading])
                        }
                        
                        Button{
                            if (!showresults){
                                tapButton(colour: 4)
                                showresults = true
                            }
                        } label: {
                            Image(systemName: "square.fill")
                                .resizable()
                                .foregroundColor(.yellow)
                                .padding([.top, .leading])
                        }
                        
                    }
                    .padding(.trailing)
                }
                .background(.gray)
            }
            
            if showresults {
                if checkAnswer(colour1: choiceColour, colour2: trueColour){
                    winnerView()
                    // TODO switch back ton false
                }
                else {
                    loserView()
                }
            }
        }
        
    }
    
    func tapButton(colour: Int) {
        choiceColour = colour
    }

    func setColour() -> Int{
        return Int.random(in: 1...4)
    }

    func checkAnswer(colour1: Int, colour2: Int) -> Bool{
        if (colour1 == colour2){
            return true
        }
        return false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
