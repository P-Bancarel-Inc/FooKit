import SwiftUI

// MARK: - Weather Data
struct WeatherData: Decodable {
    let temperature: Double
    let condition: String
}

// MARK: - Weather Model
@MainActor @Observable
final class WeatherModel {
    var weather: WeatherData?
    var errorMessage: String?

    // Replace with your real API endpoint
    private let weatherAPIURL = URL(string: "https://api.example.com/randomweather")!

    func fetchWeather() async {
        do {
            let (data, response) = try await URLSession.shared.data(from: weatherAPIURL)

            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                errorMessage = "Bad response from server"
                weather = nil
                return
            }

            let decoded = try JSONDecoder().decode(WeatherData.self, from: data)
            weather = decoded
            errorMessage = nil
        } catch {
            errorMessage = "Failed to fetch weather: \(error.localizedDescription)"
            weather = nil
        }
    }
}
