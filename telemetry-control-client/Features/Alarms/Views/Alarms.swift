import SwiftUI

struct AlarmsView: View {
    @ObservedObject var alarmManager = AlarmManager.shared

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(alarmManager.alarms) { alarm in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(alarm.title)
                                    .font(.headline)
                                Text(alarm.message)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Text("\(alarm.date, formatter: DateFormatter.shortDateTime)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            if !alarm.isAcknowledged {
                                Button(action: {
                                    alarmManager.acknowledgeAlarm(id: alarm.id)
                                }) {
                                    Text("Acknowledge")
                                        .font(.footnote)
                                        .padding(6)
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                }
                            } else {
                                Text("Acknowledged")
                                    .font(.footnote)
                                    .foregroundColor(.green)
                            }

                            // Delete Button for Individual Alarm
                            Button(action: {
                                alarmManager.deleteAlarm(id: alarm.id)
                            }) {
                                Image(systemName: "trash")
                                    .padding(6)
                                    .foregroundColor(.red)
                            }
                        }
                        .padding(.vertical, 5)
                    }
                }

                // Clear All Alarms Button
                Button(action: {
                    alarmManager.clearAllAlarms()
                }) {
                    Text("Clear All Alarms")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
            .navigationTitle("Alarms")
        }
    }
}

extension DateFormatter {
    static var shortDateTime: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
}

