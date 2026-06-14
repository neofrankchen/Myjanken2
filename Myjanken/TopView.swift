import SwiftUI

struct TopView: View {
    @Binding var isGameStarted: Bool
    var body: some View {
        NavigationStack {
            Text("じゃんけんゲーム")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            NavigationLink{
                ContentView()
            }label: {
                Text("ゲームスタート")
                    .padding(.horizontal, 30)
                    .padding(.vertical, 12)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(Capsule())
            }
            
            
        }
    }
}

#Preview {
    TopView(isGameStarted: .constant(false))
}
