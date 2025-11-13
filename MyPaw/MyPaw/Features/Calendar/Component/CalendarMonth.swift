//
//  CalendarMonth.swift
//  MyPaw
//
//  Created by Emma on 12/11/2025.
//

import SwiftUI

struct CalendarMonth: View {
    @Binding var month: Date
    
    var dayFor: (Date) -> DayModel?
    var onSelect: (Date) -> Void = { _ in }
    var onAddTodayMood: () -> Void = {}
    @State var selectedDate: Date? = Date.now
    @Environment(\.calendar) private var calendar
    @Environment(\.locale) private var locale
    @State var legend: Bool = false
    @Binding var addEvent : Bool
    
    private var daysGrid: [Date?] {
        let cal = calendar
        let startOfMonth = cal.date(from: cal.dateComponents([.year, .month], from: month))!
        let range = cal.range(of: .day, in: .month, for: startOfMonth)!
        let firstWeekdayIndex = cal.component(.weekday, from: startOfMonth) - cal.firstWeekday
        let leading = (firstWeekdayIndex + 7) % 7
        
        var result: [Date?] = Array(repeating: nil, count: leading)
        for day in range {
            result.append(cal.date(byAdding: .day, value: day - 1, to: startOfMonth)!)
        }
        return result
    }
    
    private var monthTitle: String {
        let f = DateFormatter()
        f.calendar = calendar
        f.locale = locale
        f.dateFormat = "LLLL"
        return f.string(from: month).capitalized
    }
    
    private var yearTitle: String {
        let f = DateFormatter()
        f.calendar = calendar
        f.locale = locale
        f.dateFormat = "yyyy"
        return f.string(from: month)
    }
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading, spacing: 0) {
                //MARK: - Header
                
                //si temps : faire en sorte qu'on puisse le drag plutôt que de devoir appuyer sur des boutons
                HStack {
                    Button { shiftMonth(-1) } label: {
                        Image(systemName: "chevron.left").font(.headline)
                    }
                    Spacer()
                    VStack{
                        Text(monthTitle)
                            .font(.system(size: 22, weight: .semibold))
                        Text(yearTitle)
                            .font(.system(size: 22, weight: .semibold))
                        
                    }
                    Spacer()
                    
                    Button { shiftMonth(+1) } label: {
                        Image(systemName: "chevron.right").font(.headline)
                    }
                }
                .foregroundStyle(.black)
                .padding(.horizontal)
                
                
                HStack{
                    Image(.kiki)
                        .resizable()
                        .scaledToFit()
                    
                    
                    ZStack{
                        Image(.bulleMessage)
                            .offset(x:-40, y:-5)
                        
                        Text("Changez régulièrement l’eau de votre animal et surveillez son appétit : c’est un bon indicateur de son bien-être.")
                            .font(.system(size: 12))
                            .foregroundStyle(.whiteDirt)
                            .frame(width: 150)
                            .offset(y:-5)
                        
                        
                    }
                }
                .padding()
                .offset(x:40)
                
                
                HStack{
                    Spacer()
                    Button(action: {
                        legend.toggle()
                    }, label: {
                        Image(systemName: "info.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundStyle(.orangeMid)
                            .padding()
                    })
                    
                    
                }
                
                
                ScrollView{
                    //MARK: - Weekday row
                    HStack {
                        ForEach(weekdaySymbols(), id: \.self) { s in
                            Text(s).font(.system(size: 13, weight: .semibold))
                                .foregroundStyle(.secondary)
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .padding()
                    
                    //MARK: -  Grid
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 7), spacing: 20) {
                        ForEach(daysGrid.indices, id: \.self) { i in
                            if let date = daysGrid[i] {
                                DayCell(
                                    date: date,
                                    day: dayFor(date),
                                    onSelect: {
                                        selectedDate = date
                                        onSelect(date) },
                                    onAddTodayMood: onAddTodayMood
                                )
                                .frame(height: 36)
                            } else {
                                Color.clear.frame(height:36)
                            }
                        }
                    }
                    .padding(.bottom)
                    .padding(.horizontal)
                    
                    if let selected = selectedDate, let day = dayFor(selected) {
                        ForEach(day.event, id: \.id){ event in
                            HStack {
                                VStack(alignment: .leading) {
                                    
                                    
                                    Text("\(event.title)")
                                        .font(.title3)
                                    
                                    HStack{
                                        ForEach(event.animal){ animal in
                                            HStack{
                                                Circle().fill(.pinkNose)
                                                    .frame(width: 10)
                                                
                                                Text(animal.name)
                                            }
                                            .padding(5)
                                            .padding(.horizontal, 3)
                                            .background(Color.whiteDirt)
                                            .clipShape(RoundedRectangle(cornerRadius: 20))
                                        }
                                    }
                                    
                                    
                                    Text("\(event.description)")
                                        .padding(.vertical)
                                    
                                    HStack {
                                        Circle().fill(event.type.color).frame(width: 10)
                                        Text(selected.formatted(date: .abbreviated, time: .omitted))
                                    }
                                }
                                
                                Spacer()
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 30).fill(event.type.color.opacity(0.5)))
                            .padding()
                            .id(event.id)
                            
                            
                        }
                        
                    } else {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Il n'y a rien à cette date. Profite en pour faire une séance calin ou jouer avec tes animaux !")
                                    .font(.headline)
                                    .foregroundStyle(.secondary)
                            }
                            
                        }
                        .padding()
                    }
                    
                    
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
                
                
                
            }
            
            if legend{
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        legend.toggle()
                    }
                PopUpLegendeView()
            }
        }
    }
    
    private func shiftMonth(_ delta: Int) {
        if let new = calendar.date(byAdding: .month, value: delta, to: month) { month = new }
    }
    
    private func weekdaySymbols() -> [String] {
        let sym = calendar.shortWeekdaySymbols
        let start = calendar.firstWeekday - 1
        return Array(sym[start...] + sym[..<start]).map { $0.uppercased() }
    }
}

// MARK: - DayCell
private struct DayCell: View {
    let date: Date
    let day: DayModel?
    
    
    let onSelect: () -> Void
    let onAddTodayMood: () -> Void
    
    @Environment(\.calendar) private var calendar
    
    private var isToday: Bool { calendar.isDateInToday(date) }
    private var isPast: Bool {
        calendar.startOfDay(for: date) < calendar.startOfDay(for: Date())
    }
    private var hasEvent: Bool {
        guard let d = day else { return false }
        return !d.event.isEmpty
    }
    
    var body: some View {
        Group {
            if hasEvent, let d = day {
                Button(action: onSelect) {

                    ZStack {
                        
                        
                        Circle().fill(d.event[0].type.color)
                        if isToday {
                            Circle()
                                .inset(by: -3)
                                .strokeBorder(.orangeDeep,lineWidth: 1)
                                
                        }
                           
                        Text(String(calendar.component(.day, from: date)))
                            .font(.system(size: 16))
                            .padding(15)
                            
                    }
                    
                }
                .buttonStyle(.plain)
            }  else {
                Button(action: onSelect) {
                    ZStack {
                       
                        Circle().fill(Color.orangeMid.opacity(0.5))
                        if isToday {
                            Circle()
                                .inset(by: -3)
                                .strokeBorder(.orangeDeep,lineWidth: 1)
                                
                        }
                        Text(String(calendar.component(.day, from: date)))
                            .font(.system(size: 16))
                            .bold()
                            .padding(15)
                    }
                }
                .buttonStyle(.plain)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .contentShape(Rectangle())
        .foregroundStyle(.whiteDirt)
     
    }
}
