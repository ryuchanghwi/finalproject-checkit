//
//  GroupScheduleView.swift
//  CheckIt
//
//  Created by 조현호 on 2023/01/18.
//

import SwiftUI
import AlertToast

struct GroupScheduleView: View {
    var group: Group
    @EnvironmentObject var scheduleStore: ScheduleStore
    @State private var showToast = false
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    
                    NavigationLink {
                        AddScheduleView(group: group, showToast: $showToast)
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width:20, height:20)
                            .foregroundColor(.black)
                            .padding(5)
                    }
                }
                
                VStack {
                    ScrollView {
                        ForEach(scheduleStore.scheduleList) { schedule in
                            VStack {
                                ZStack(alignment: .leading) {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(Color.myLightGray)
                                        .frame(height: 150)
                                    
                                    VStack(alignment: .leading) {
                                        
                                        HStack {
                                            customSymbols(name: "calendar")
                                            // MARK: - 동아리 일정 날짜
                                            Text("\(schedule.startTime, format:.dateTime.year().day().month())")
                                        }
                                        
                                        HStack {
                                            customSymbols(name: "clock")
                                            // MARK: - 동아리 일정 시간
                                            Text("\(schedule.startTime, format:.dateTime.hour().minute())")
                                            Text("~")
                                            Text("\(schedule.endTime, format:.dateTime.hour().minute())")
                                        }
                                        
                                        HStack {
                                            customSymbols(name: "mapPin")
                                            // MARK: - 동아리 일정 장소
                                            Text(schedule.location)
                                        }
                                    }
                                    .padding(30)
                                }
                            }
                        }
                    }
                }
                .onAppear {
                    scheduleStore.fetchSchedule(gruopName: group.name)
                }
                .refreshable {
                    scheduleStore.fetchSchedule(gruopName: group.name)
                }
                
            }
            .padding(.horizontal, 30)
        }
        .toast(isPresenting: $showToast){
            
            // .alert is the default displayMode
            AlertToast(type: .complete(Color.green), title: "Message Sent!")
            
            //Choose .hud to toast alert from the top of the screen
            //AlertToast(displayMode: .hud, type: .regular, title: "Message Sent!")
            
            //Choose .banner to slide/pop alert from the bottom of the screen
            //AlertToast(displayMode: .banner(.slide), type: .regular, title: "Message Sent!")
        }
    }
    
}


//struct GroupScheduleView_Previews: PreviewProvider {
//    static var previews: some View {
//        GroupScheduleView(group: Group.sampleGroup)
//    }
//}
