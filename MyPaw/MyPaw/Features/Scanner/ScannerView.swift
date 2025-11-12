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
        init(parent: ScannerView) { self.parent = parent }
        func metadataOutput(_ output: AVCaptureMetadataOutput,
                            didOutput metadataObjects: [AVMetadataObject],
                            from connection: AVCaptureConnection) {
            guard let codeObj = metadataObjects.first as? AVMetadataMachineReadableCodeObject,
                  let code = codeObj.stringValue else { return }
            DispatchQueue.main.async { self.parent.viewModel.handleScan(code) }
        }
    }

    func makeCoordinator() -> Coordinator { Coordinator(parent: self) }

    func makeUIView(context: Context) -> PreviewView {
        let view = PreviewView()
        view.configureSession(delegate: context.coordinator)
        // ✅ Force à ne pas respecter les safe areas
        view.insetsLayoutMarginsFromSafeArea = false
        return view
    }

    func updateUIView(_ uiView: PreviewView, context: Context) {}
}

final class PreviewView: UIView {
    private let session = AVCaptureSession()
    private let previewLayer: AVCaptureVideoPreviewLayer

    override init(frame: CGRect) {
        self.previewLayer = AVCaptureVideoPreviewLayer(session: session)
        super.init(frame: frame)
        backgroundColor = .black
        previewLayer.videoGravity = .resizeAspectFill // ✅ Déjà bon
        layer.addSublayer(previewLayer)
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override func layoutSubviews() {
        super.layoutSubviews()
        // ✅ Force le layer à prendre TOUT l'écran, y compris safe areas
        if let window = window {
            previewLayer.frame = window.bounds
        } else {
            previewLayer.frame = bounds
        }
    }

    func configureSession(delegate: AVCaptureMetadataOutputObjectsDelegate) {
        // ✅ Change le preset pour une meilleure résolution
        session.sessionPreset = .photo // ou .high
        
        guard let videoDevice = AVCaptureDevice.default(for: .video),
              let videoInput = try? AVCaptureDeviceInput(device: videoDevice),
              session.canAddInput(videoInput) else {
            print("⚠️ Impossible d'accéder à la caméra")
            return
        }
        session.addInput(videoInput)

        let metadataOutput = AVCaptureMetadataOutput()
        guard session.canAddOutput(metadataOutput) else { return }
        session.addOutput(metadataOutput)
        metadataOutput.setMetadataObjectsDelegate(delegate, queue: .main)
        metadataOutput.metadataObjectTypes = [.ean13, .ean8, .code128, .qr]

        session.startRunning()
    }
}
