//
//  CalendarView.swift
//  MyPaw
//
//  Created by Emma on 12/11/2025.
//

import SwiftUI

struct CalendarCustomView: View {
    @State private var month = Date()
    @State private var selectedDate: Date?
    @State var vm = DaysViewModel()
    @State private var detailDay: DayModel?
    @State var addEvent: Bool = false
    var body: some View {
        ZStack{
            
            Color.whiteDirt.ignoresSafeArea()
            
            
            VStack {
                CalendarMonth(
                    month: $month,
                    dayFor: { date in vm.day(for: date) },
                    onSelect: { date in
                        selectedDate = date
                        let cal = Calendar.current
                        let today = cal.startOfDay(for: Date())
                        let dayStart = cal.startOfDay(for: date)
                        
                        if let d = vm.day(for: date),
                           dayStart <= today {
                            detailDay = d
                        } else {
                            detailDay = nil
                        }
                    }
                )
                
                Spacer()
            }
           
            
            VStack{
                Spacer()
                
                Button(action: {
                    addEvent.toggle()
                }, label: {
                    Text("Ajouter")
                        .padding()
                        .background(.orangeDeep)
                        .foregroundStyle(.whiteDirt)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                })
                .padding()
            }
            
            if addEvent{
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        addEvent.toggle()
                    }
                AddEventPopUp(dayVM: $vm, popup: $addEvent)
            }
        }
        
        
        
    }
}

#Preview {
    CalendarCustomView()
}
