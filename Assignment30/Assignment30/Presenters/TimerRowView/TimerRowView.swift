//
//  TimerRowView.swift
//  Assignment30
//
//  Created by MacBook on 11.12.24.
//

import SwiftUI

struct TimerRowView: View {
    @Binding var timer: TimerModel
    var onDelete: () -> Void
    var onToggle: () -> Void
    var onReset: () -> Void
    
    private var titleText: some View {
        Text(timer.title)
            .font(.interMedium(size: 18))
            .foregroundStyle(.primaryWhite)
    }
    
    private var deleteButton: some View {
        Button(action: onDelete) {
            Image("delete")
                .resizable()
        }
        .frame(width: 24, height: 24)
        .foregroundColor(.primaryRed)
    }
    
    private var timeText: some View {
        Text(formatTime(timer.timeRemaining))
            .font(.interBold(size: 36))
            .foregroundStyle(.primaryBlue)
    }
    
    private var startButton: some View {
        Button(action: {
            onToggle()
        }) {
            Text(timer.isON ? "პაუზა" : "დაწყება")
                .font(.interMedium(size: 16))
                .foregroundStyle(.primaryWhite)
        }
        .padding(.all, 10)
        .background(timer.isON ? .primaryOrange : .primaryGreen)
        .cornerRadius(8)
        .buttonStyle(PlainButtonStyle())
    }
    
    private var resetButton: some View {
        Button(action: onReset) {
            Text("გადატვირთვა")
                .font(.interMedium(size: 16))
                .foregroundStyle(.primaryWhite)
        }
        .padding(.all, 10)
        .background(.primaryRed)
        .cornerRadius(8)
    }
    
    var body: some View {
        LazyVStack {
            HStack {
                titleText
                
                Spacer()
                
                deleteButton
            }
            .padding(.horizontal, 20)
            
            timeText
            
            LazyHStack {
                startButton
                resetButton
            }
        }
        .frame(width: 360, height: 177)
        .background(.primaryDarkGrey)
        .cornerRadius(16)
    }
    
    private func formatTime(_ time: Int) -> String {
        let hours = time / 3600
        let minutes = (time % 3600) / 60
        let seconds = time % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}

#Preview {
    TimerRowView(
        timer: .constant(TimerModel(title: "საცდელი ტაიმერი", duration: 3600)),
        onDelete: { },
        onToggle: { },
        onReset: { }
    )
}
