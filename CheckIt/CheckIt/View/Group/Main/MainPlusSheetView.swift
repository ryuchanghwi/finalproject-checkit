//
//  MainPlusSheetView.swift
//  CheckIt
//
//  Created by 황예리 on 2023/01/23.
//

import SwiftUI

struct MainPlusSheetView: View {
    @State var isMakingGroup: Bool = false
    @State var isJoiningGroup: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            Text("원하는 동아리를 직접 만들어보세요!\n동아리에 가입도 할 수 있습니다.")
                .font(.title2.bold())
            
            Text("아래 버튼을 누르면 개설이 시작돼요.")
                .font(.title3)
            
            // MARK: - 동아리 개설하기 버튼
            Button {
                isMakingGroup.toggle()
            } label: {
                Text("동아리 개설하기")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 60)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 3))
                    .background(Color.white)
                    .cornerRadius(20)
            }
            .sheet(isPresented: $isMakingGroup) {
                MakeGroupModalView()
                    .presentationDetents([.height(450)])
            }
            
            Text("공유 받은 초대 코드를 입력해주세요.")
                .font(.title3)
            
            // MARK: - 동아리 참가하기 버튼
            Button {
                isJoiningGroup.toggle()
            } label: {
                Text("동아리 참가하기")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 60)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 3))
                    .background(Color.white)
                    .cornerRadius(20)
            }
            .sheet(isPresented: $isJoiningGroup) {
                JoinGruopModalView()
                    .presentationDetents([.height(300)])
            }
        }
        .padding(.horizontal, 40)
        .presentationDragIndicator(.visible)
    }
}

struct MainPlusSheetView_Previews: PreviewProvider {
    static var previews: some View {
        MainPlusSheetView()
    }
}
