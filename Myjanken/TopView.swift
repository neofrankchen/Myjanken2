import SwiftUI

struct TopView: View {
    @Binding var isGameStarted: Bool
    
    var body: some View {
        ZStack {
            Image("janken_home")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                Spacer()

                Button {
                    isGameStarted = true
                } label: {
                    Color.clear
                        .frame(width: 280, height: 70)
                }
                .padding(.bottom, 210)
            }
        }
    }
}

#Preview {
    TopView(isGameStarted: .constant(false))
}
