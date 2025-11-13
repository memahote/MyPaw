import WidgetKit
import SwiftUI

// 1️⃣ Les données du widget
struct AppointmentEntry: TimelineEntry {
    let date: Date
    let petName: String
    let appointmentDate: Date
    let appointmentTitle: String
}

// 2️⃣ Le provider qui fournit les données
struct AppointmentProvider: TimelineProvider {
    func placeholder(in context: Context) -> AppointmentEntry {
        AppointmentEntry(
            date: Date(),
            petName: "Sam, Clover et Alex",
            appointmentDate: Date().addingTimeInterval(86400 * 7), // dans 7 jours
            appointmentTitle: "Vaccin"
        )
    }

    func getSnapshot(in context: Context, completion: @escaping (AppointmentEntry) -> ()) {
        let entry = AppointmentEntry(
            date: Date(),
            petName: "Sam, Clover et Alex",
            appointmentDate: Date().addingTimeInterval(86400 * 7),
            appointmentTitle: "Vaccin"
        )
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        // 🔥 ICI tu iras chercher les vraies données (UserDefaults avec App Groups, ou autre)
        // Pour l'instant on met des données de test
        let entry = AppointmentEntry(
            date: Date(),
            petName: "Sam, Clover et Alex",
            appointmentDate: Date().addingTimeInterval(86400 * 7),
            appointmentTitle: "Vaccin"
        )
        
        // Le widget se refresh tous les jours à minuit
        let midnight = Calendar.current.startOfDay(for: Date().addingTimeInterval(86400))
        let timeline = Timeline(entries: [entry], policy: .after(midnight))
        completion(timeline)
    }
}

// 3️⃣ La vue du widget
struct AppointmentWidgetView : View {
    var entry: AppointmentProvider.Entry
    
    // Formatteur de date pour afficher "mardi 23 décembre"
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "fr_FR")
        formatter.dateFormat = "EEEE d MMMM"
        return formatter.string(from: entry.appointmentDate).capitalized
    }

    var body: some View {
            HStack{
                
                Image("kikiMascotte") // 🔥 Assure-toi que l'image est dans les Assets du WIDGET
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                
                
                
                // Date et titre du rdv
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text("Le prochain rdv pour \n \(entry.petName)")
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()

                    Text(formattedDate)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text(entry.appointmentTitle)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }.padding(.leading, 30)
            }
        
        .padding()
        .containerBackground(.fill.tertiary, for: .widget)
    }
}

// 4️⃣ La config du widget
struct MyPawWidget: Widget {
    let kind: String = "MyPawWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: AppointmentProvider()) { entry in
            AppointmentWidgetView(entry: entry)
        }
        .configurationDisplayName("Prochain RDV")
        .description("Affiche le prochain rendez-vous de votre animal")
        .supportedFamilies([.systemMedium])
    }
}

// 5️⃣ Preview pour voir le widget dans Xcode
#Preview(as: .systemMedium) {
    MyPawWidget()
} timeline: {
    AppointmentEntry(
        date: .now,
        petName: "Sam, Clover et Alex",
        appointmentDate: Date().addingTimeInterval(86400 * 7),
        appointmentTitle: "Vaccin"
    )
}
