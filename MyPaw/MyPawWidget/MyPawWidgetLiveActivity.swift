//
//  MyPawWidgetLiveActivity.swift
//  MyPawWidget
//
//  Created by Lucie Grunenberger  on 13/11/2025.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct MyPawWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct MyPawWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: MyPawWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension MyPawWidgetAttributes {
    fileprivate static var preview: MyPawWidgetAttributes {
        MyPawWidgetAttributes(name: "World")
    }
}

extension MyPawWidgetAttributes.ContentState {
    fileprivate static var smiley: MyPawWidgetAttributes.ContentState {
        MyPawWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: MyPawWidgetAttributes.ContentState {
         MyPawWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: MyPawWidgetAttributes.preview) {
   MyPawWidgetLiveActivity()
} contentStates: {
    MyPawWidgetAttributes.ContentState.smiley
    MyPawWidgetAttributes.ContentState.starEyes
}
