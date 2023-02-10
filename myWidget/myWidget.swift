//
//  myWidget.swift
//  myWidget
//
//  Created by creohwan on 2023/01/31.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: TimelineProvider {
    
//    @EnvironmentObject var network: NetworkManager
    
    let date = Date()
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: date)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: date)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        var entries: [SimpleEntry] = []
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
        
        Task {
            let entry = SimpleEntry(date: date)

            do {
                NetworkManager.shared.getMenu(restaurant: 2, dayIndex: 0)
                WidgetCenter.shared.reloadTimelines(ofKind: "junghwan")
                let nextUpdate = Calendar.current.date(byAdding: .minute, value: 15, to: Date())
                let timeline = Timeline(entries: [entry], policy: .after(nextUpdate!))
                completion(timeline)
            } catch {
                print(error.localizedDescription)
            }
        }
        
        
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct myWidget: Widget {
    let kind: String = "junghwan"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            myWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("밥인지")
        .description("설정된 식당에 대한 오늘의 메뉴를 보여줍니다.")
    }
}
