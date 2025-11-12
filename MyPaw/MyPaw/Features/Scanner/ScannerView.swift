//
//  ScannerViewModel.swift
//  MyPaw
//
//  Created by Lucie Grunenberger  on 12/11/2025.
//

import SwiftUI
import AVFoundation

struct ScannerView: UIViewRepresentable {
    @ObservedObject var viewModel: ScannerViewModel
    
    class Coordinator: NSObject, AVCaptureMetadataOutputObjectsDelegate {
        let parent: ScannerView
        
        init(parent: ScannerView) {
            self.parent = parent
        }
        
        func metadataOutput(_ output: AVCaptureMetadataOutput,
                            didOutput metadataObjects: [AVMetadataObject],
                            from connection: AVCaptureConnection) {
            
            guard let metadataObj = metadataObjects.first as? AVMetadataMachineReadableCodeObject,
                  let code = metadataObj.stringValue else { return }
            
            DispatchQueue.main.async {
                self.parent.viewModel.handleScan(code)
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> PreviewView {
        let view = PreviewView()
        view.configureSession(delegate: context.coordinator)
        return view
    }
    
    func updateUIView(_ uiView: PreviewView, context: Context) {}
}

/// ✅ Vue UIKit qui gère l’affichage caméra (plein écran)
final class PreviewView: UIView {
    private let session = AVCaptureSession()
    private let previewLayer: AVCaptureVideoPreviewLayer
    
    override init(frame: CGRect) {
        self.previewLayer = AVCaptureVideoPreviewLayer(session: session)
        super.init(frame: frame)
        backgroundColor = .black
        
        previewLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(previewLayer)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        previewLayer.frame = self.bounds

        print("📸 Preview resized to: \(bounds.size)")
    }

    
    func configureSession(delegate: AVCaptureMetadataOutputObjectsDelegate) {
        guard let videoDevice = AVCaptureDevice.default(for: .video),
              let videoInput = try? AVCaptureDeviceInput(device: videoDevice),
              session.canAddInput(videoInput) else {
            print("⚠️ Impossible d’accéder à la caméra")
            return
        }
        session.addInput(videoInput)
        
        let metadataOutput = AVCaptureMetadataOutput()
        guard session.canAddOutput(metadataOutput) else { return }
        session.addOutput(metadataOutput)
        metadataOutput.setMetadataObjectsDelegate(delegate, queue: .main)
        metadataOutput.metadataObjectTypes = [.ean13, .ean8, .code128, .qr]
        
        DispatchQueue.global(qos: .userInitiated).async {
            self.session.startRunning()
        }
    }
}
