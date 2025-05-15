//
//  QuickTimerView.swift
//  Assignment30
//
//  Created by MacBook on 16.12.24.
//

import SwiftUI

struct QuickTimerView: View {
    @ObservedObject var viewModel: TimerViewModel
    @Binding var showingQuickTimers: Bool
    
    private let columns = [
        GridItem(),
        GridItem(),
        GridItem()
    ]
    
    let quickTimers: [TimerModel] = [
        TimerModel(title: "მედიტაცია", duration: 15 * 60),
        TimerModel(title: "დარბაზი", duration: 30 * 60),
        TimerModel(title: "სწავლა", duration: 60 * 60),
        TimerModel(title: "დასვენება", duration: 10 * 60),
        TimerModel(title: "ვარჯიში", duration: 45 * 60),
        TimerModel(title: "ფოკუსირება", duration: 20 * 60),
        TimerModel(title: "ძაღლის გასეირნება", duration: 25 * 60),
        TimerModel(title: "სეირნობა", duration: 30 * 60),
        TimerModel(title: "სირბილი", duration: 60 * 60)
    ]
    
    var body: some View {
        ScrollView{
            ZStack {
                Color.primaryNoirGrey
                    .ignoresSafeArea(.all)
                
                VStack(alignment: .leading) {
                    headlineText
                        .padding()
                    
                    LazyVGrid(columns: columns, spacing: 12) {
                        ForEach(quickTimers) { timer in
                            Button(action: {
                                viewModel.addTimer(title: timer.title, duration: timer.duration)
                                showingQuickTimers = false
                            }) {
                                VStack(spacing: 5) {
                                    Text(formatTime(timer.duration))
                                        .font(.robotoBold(size: 20))
                                        .foregroundStyle(.primaryBlue)
                                    
                                    Text(timer.title)
                                        .font(.robotoRegular(size: 13))
                                        .foregroundColor(.primaryWhite)
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 94)
                                .padding()
                                .background(.primaryGrey)
                                .cornerRadius(12)
                            }
                        }
                    }
                    .padding()
                }
                .padding()
            }
        }
        .background(.primaryNoirGrey)
    }
    
    private var headlineText: some View {
        Text("სწრაფი ტაიმერები")
            .font(.robotoBold(size: 20))
            .foregroundStyle(.primaryWhite)
            .frame(alignment: .leading)
    }
}

#Preview {
    QuickTimerView(viewModel: TimerViewModel(), showingQuickTimers: .constant(false))
}
