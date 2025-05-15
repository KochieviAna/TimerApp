//
//  TimersView.swift
//  Assignment30
//
//  Created by MacBook on 11.12.24.
//

import SwiftUI

struct TimersView: View {
    @StateObject private var viewModel = TimerViewModel()
    @State private var newTitle: String = ""
    @State private var newHours: String = ""
    @State private var newMinutes: String = ""
    @State private var newSeconds: String = ""
    
    @State private var showingQuickTimers = false
    @State private var blurEffect = false
    
    func addNewTimer() {
        let hours = Int(newHours) ?? 0
        let minutes = Int(newMinutes) ?? 0
        let seconds = Int(newSeconds) ?? 0
        
        let totalDuration = (hours * 3600) + (minutes * 60) + seconds
        viewModel.addTimer(title: newTitle, duration: totalDuration)
        
        newTitle = ""
        newHours = ""
        newMinutes = ""
        newSeconds = ""
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                LazyHStack {
                    timerHeadlineText
                    
                    Spacer(minLength: 190)
                    
                    plusButton
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 110)
                .background(Color.primaryDarkGrey)
                
                ScrollView {
                    timerList
                }
                .padding()
                .scrollContentBackground(.hidden)
                .background(.clear)
                
                LazyVStack {
                    timerTitleTextFields
                    
                    LazyHStack {
                        hoursTextField
                        minutesTextField
                        secondsTextField
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    
                    addTimerButton
                }
                .padding()
                .background(Color.primaryDarkGrey)
            }
            .background(Color.primaryNoirGrey)
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
            .navigationBarHidden(true)
            .blur(radius: blurEffect ? 10 : 0)
            .sheet(isPresented: $showingQuickTimers, onDismiss: {
                withTransaction(Transaction(animation: .none)) {
                    blurEffect = false
                }
            }) {
                QuickTimerView(viewModel: viewModel, showingQuickTimers: $showingQuickTimers)
                    .ignoresSafeArea()
                    .presentationDetents([.height(490), .medium, .height(650)])
                    .presentationDragIndicator(.hidden)
                    .interactiveDismissDisabled()
            }
        }
    }
    
    private var timerHeadlineText: some View {
        LazyVStack(alignment: .leading) {
            Text("ტაიმერები")
                .font(.interBold(size: 24))
                .foregroundStyle(.primaryWhite)
                .padding()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 110)
        .background(Color.primaryDarkGrey)
    }
    
    private var plusButton: some View {
        Button(action: {
            showingQuickTimers.toggle()
            blurEffect.toggle()
        }) {
            Image(systemName: "plus")
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .font(.system(size: 30))
                .foregroundColor(.primaryWhite)
        }
    }
    
    private var timerList: some View {
        ForEach(viewModel.timers.indices, id: \.self) { index in
            NavigationLink(destination: TimerDetailsView(viewModel: viewModel, timer: $viewModel.timers[index])) {
                TimerRowView(
                    timer: $viewModel.timers[index],
                    onDelete: { viewModel.deleteTimer(index: index) },
                    onToggle: { viewModel.toggleTimer(index: index) },
                    onReset: { viewModel.resetTimer(index: index) }
                )
                .contentShape(Rectangle())
                .background(.clear)
            }
        }
    }
    
    private var timerTitleTextFields: some View {
        PlaceholderTextField(
            placeholder: "ტაიმერის სახელი",
            text: $newTitle,
            alignment: .leading,
            frameWidth: 350
        )
    }
    
    private var hoursTextField: some View {
        PlaceholderTextField(
            placeholder: "სთ",
            text: $newHours,
            keyboardType: .numberPad,
            alignment: .center,
            frameWidth: 110
        )
    }
    
    private var minutesTextField: some View {
        PlaceholderTextField(
            placeholder: "წთ",
            text: $newMinutes,
            keyboardType: .numberPad,
            alignment: .center,
            frameWidth: 110
        )
    }
    
    private var secondsTextField: some View {
        PlaceholderTextField(
            placeholder: "წმ",
            text: $newSeconds,
            keyboardType: .numberPad,
            alignment: .center,
            frameWidth: 110
        )
    }
    
    private var addTimerButton: some View {
        Button("დამატება") {
            addNewTimer()
        }
        .padding()
        .frame(width: 155, height: 42)
        .background(.primaryBlue)
        .cornerRadius(8)
        .foregroundColor(.white)
    }
}

#Preview {
    TimersView()
}
