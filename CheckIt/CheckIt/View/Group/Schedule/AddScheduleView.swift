//
//  AddScheduleView.swift
//  CheckIt
//
//  Created by 조현호 on 2023/01/18.
//

import AlertToast
import SwiftUI

struct AddScheduleView: View {
    @State private var startTime: Date = Date()
    @State private var endTime: Date = Date()
    @State private var place: String = ""
    @State private var memo: String = ""
    @State private var placeholderText: String = "메모(선택)"
    @State private var lateMin: Int = 0
    @State private var lateFee: Int = 0
    @State private var absentFee: Int = 0
    
    @State var isShowingWebView: Bool = false
    @State var bar = true
    @ObservedObject var viewModel = WebViewModel()
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var scheduleStore: ScheduleStore
    @Binding var showToast: Bool
    
    var group: Group
    
    var body: some View {
        ScrollView {
            VStack(alignment:.leading, spacing: 20) {
                Text("일정 추가하기")
                    .font(.system(size: 24, weight: .semibold))
                
                Divider()
                
                Text("일정 정보")
                    .font(.system(size: 20, weight: .regular))
                
                // MARK: - 일정 정보 Section
                VStack(alignment:.leading, spacing: 22) {
                    
                    HStack(spacing: 12) {
                        customSymbols(name: "calendar")
                        
                        // MARK: - 시작 시간 DatePicker
                        // FIXME: - 미래 시간 선택되게 수정하기
                        DatePicker(selection: $startTime, in: ...Date(), displayedComponents: .date) {
                            Text("날짜를 선택해주세요.")
                        }
                        .onChange(of: startTime) {newValue in
                            
                        }
                    }
                    
                    HStack(spacing: 12) {
                        customSymbols(name: "clock")
                        // MARK: - 시작 시간 DatePicker
                        // FIXME: - 시작 시간이 종료 시간보다 뒤면 안되는 조건 추가하기
                        DatePicker("시작 시간", selection: $startTime,
                                   displayedComponents: .hourAndMinute)
                    }
                    
                    HStack(spacing: 12) {
                        customSymbols(name: "clock")
                        
                        // MARK: - 종료 시간 DatePicker
                        DatePicker("종료 시간", selection: $endTime,
                                   displayedComponents: .hourAndMinute)
                    }
                    
                    HStack(spacing: 12) {
                        customSymbols(name: "mapPin")
                        
                        ZStack {
                            Button {
                                isShowingWebView.toggle()
                            } label: {
                                ZStack(alignment: .leading) {
                                    Rectangle()
                                        .frame(width: 250)
                                        .foregroundColor(Color.white)
                                    
                                    Text("\(viewModel.result ?? "장소를 입력해주세요.")")
                                        .foregroundColor(Color.black)
                                }
                            }
                        }
                    }
                    
                    Spacer(minLength: 1)
                    
                    ZStack {
                        // MARK: - 동아리 메모 TextEditor
                        if self.memo.isEmpty {
                            TextEditor(text: $placeholderText)
                                .padding(.horizontal,15)
                                .padding(.vertical,10)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                .frame(height: 100)
                                .background(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray, lineWidth: 2)
                                )
                                .cornerRadius(10)
                                .padding(.bottom, 23)
                                .disabled(true)
                        }
                        TextEditor(text: $memo)
                            .padding(.horizontal,15)
                            .padding(.vertical,10)
                            .font(.subheadline)
                            .lineSpacing(10)
                            .multilineTextAlignment(.leading)
                            .opacity(self.memo.isEmpty ? 0.25 : 1)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.myGray, lineWidth: 2)
                            )
                            .frame(height: 100)
                            .padding(.bottom, 23)
                    }
                }
                .padding(5)
                
                Divider()
                
                // MARK: - 출석 인정 시간 Section
                VStack(alignment: .leading, spacing: 25) {
                        Text("출석 인정 시간")
                            .font(.system(size: 20, weight: .regular))
                    
                        HStack {
                            customSymbols(name: "clock")
                                .padding(10)
                            
                            // MARK: - 출석 인정 시간 TextField
                            TextField("", value: $lateMin, format: .number)
                                .frame(width: 68)
                                .textFieldStyle(.roundedBorder)
                            
                            Text("분 전부터 ~ 5분 후까지")
                        }
                    
                    HStack(spacing: 35) {
                        VStack(alignment: .leading, spacing: 20) {
                            HStack {
                                Text("지각")
                                Image(systemName: "questionmark.circle.fill")
                                    .foregroundColor(.myBlack)
                            }
                            HStack {
                                // MARK: - 지각비 TextField
                                TextField("", value: $lateFee, format: .number)
                                    .frame(width: 68)
                                    .textFieldStyle(.roundedBorder)
                                Text("원")
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 20) {
                            HStack {
                                Text("결석")
                                Image(systemName: "questionmark.circle.fill")
                                    .foregroundColor(.myBlack)
                            }
                            HStack {
                                // MARK: - 결석비 TextField
                                TextField("", value: $absentFee, format: .number)
                                    .frame(width: 68)
                                    .textFieldStyle(.roundedBorder)
                                Text("원")
                            }
                        }
                    }
                    .padding(5)
                }
                
                Spacer()
                
                // MARK: - 일정 만들기 버튼
                Button {
                    showToast.toggle()
                    
                    // 날짜정보와 시간정보를 하나의 문자열로 합침
                    let start = startTime.getDateString() + " " + startTime.getTimeString()
                    let end = startTime.getDateString() + " " + endTime.getTimeString()
                    // 문자열을 기반으로 Date 인스턴스생성
                    let start1 = start.getAllTimeInfo()
                    let end1 = end.getAllTimeInfo()
                    
                    let schedule = Schedule(id: UUID().uuidString, groupName: group.name, lateFee: lateFee, absenteeFee: absentFee, location: place, startTime: start1, endTime: end1, agreeTime: lateMin, memo: memo, attendanceCount: 0, lateCount: 0, absentCount: 0, officiallyAbsentCount: 0)
                    
                    Task {
                        await scheduleStore.addSchedule(schedule, group: group)
                    }
                    
                    dismiss()
                    
                } label: {
                    Text("일정 만들기")
                        .modifier(GruopCustomButtonModifier())
                }
            }
            .padding(.horizontal, 30)
        }
        .sheet(isPresented: $isShowingWebView) {
            WebView(url: "https://soletree.github.io/postNum/", viewModel: viewModel)
        }
        .onReceive(self.viewModel.bar.receive(on: RunLoop.main)) { value in
            self.bar = value
        }
    }
}

struct AddScheduleView_Previews: PreviewProvider {
    @State static private var showToast = false
    
    static var previews: some View {
        AddScheduleView(showToast: $showToast, group: Group.sampleGroup)
    }
}
