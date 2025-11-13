//
//  MyPawWidgetBundle.swift
//  MyPawWidget
//
//  Created by Lucie Grunenberger  on 13/11/2025.
//

import WidgetKit
import SwiftUI

@main
struct MyPawWidgetBundle: WidgetBundle {
    var body: some Widget {
        MyPawWidget()
        MyPawWidgetControl()
        MyPawWidgetLiveActivity()
    }
}
