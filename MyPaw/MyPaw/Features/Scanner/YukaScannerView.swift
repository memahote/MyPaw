import SwiftUI

struct YukaScannerView: View {
    @StateObject var viewModel = ScannerViewModel()
    @State private var navigateTo: String? = nil

    var body: some View {
        NavigationStack {
            ZStack {
                // Caméra plein écran
                ScannerView(viewModel: viewModel)
                    .ignoresSafeArea()          // ignore les safe areas
                    .frame(maxWidth: .infinity, maxHeight: .infinity)  // prend tout l’espace
                    .background(Color.black)    // évite les flash blancs


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
            .background(Color.darkBrown)
            .navigationDestination(isPresented: Binding(
                get: { viewModel.navigateTo != nil },
                set: { if !$0 { viewModel.navigateTo = nil } }
            )) {
                if viewModel.navigateTo == "catz" {
                    Text("Page Catz Fine Food 🐱")
                } else if viewModel.navigateTo == "meatz" {
                    MeatzView()
                }
            }

        }
        
    }
}

#Preview {
    YukaScannerView(viewModel: ScannerViewModel())
    
}
