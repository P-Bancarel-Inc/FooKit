import SwiftUI

// MARK: - Public WidgetView

public struct WidgetView: View {
    @State private var model = WeatherModel()

    public init() {}

    public var body: some View {
        VStack(spacing: 8) {
            if let weather = model.weather {
                Text("Temperature: \(String(format: "%.1f", weather.temperature))°C")
                    .font(.title)
                    .bold()
                Text("Condition: \(weather.condition)")
                    .font(.headline)
            } else if let error = model.errorMessage {
                Text("Error: \(error)")
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                    .padding()
            } else {
                ProgressView("Loading weather...")
            }
        }
        .padding()
        .task {
            await model.fetchWeather()
        }
    }
}

#Preview {
    WidgetView()
}
