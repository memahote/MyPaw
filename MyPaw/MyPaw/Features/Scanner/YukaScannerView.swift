import SwiftUI

struct YukaScannerView: View {
    @StateObject var viewModel = ScannerViewModel()
    @State private var navigateTo: String? = nil

    var body: some View {
        NavigationStack {
            ZStack {
                // Caméra plein écran
                ScannerView(viewModel: viewModel)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black)

                // Overlay du code
                if let code = viewModel.lastScannedCode {
                    VStack {
                        Spacer()
                        Text("Code détecté : \(code)")
                            .padding()
                            .background(.ultraThinMaterial)
                            .cornerRadius(10)
                    }
                }
            }
            .ignoresSafeArea(.all)
            .navigationBarHidden(true)
            .navigationDestination(isPresented: Binding(
                get: { viewModel.navigateTo != nil },
                set: { if !$0 { viewModel.navigateTo = nil } }
            )) {
                if viewModel.navigateTo == "catz" {
                    catzFineFood()
                } else if viewModel.navigateTo == "meatz" {
                    MeatzView()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    YukaScannerView(viewModel: ScannerViewModel())
}
