// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let city = try? newJSONDecoder().decode(City.self, from: jsonData)

//
// To read values from URLs:
//
//   let task = URLSession.shared.cityTask(with: url) { city, response, error in
//     if let city = city {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - City
struct City: Codable {
    let coord: Coord?
    let weather: [Weather]?
    let base: String?
    let main: Main?
    let visibility: Int?
    let wind: Wind?
    let clouds: Clouds?
    let dt: Int?
    let sys: Sys?
    let timezone, id: Int?
    let name: String?
    let cod: Int?
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.cloudsTask(with: url) { clouds, response, error in
//     if let clouds = clouds {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int?
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.coordTask(with: url) { coord, response, error in
//     if let coord = coord {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double?
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.mainTask(with: url) { main, response, error in
//     if let main = main {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Main
struct Main: Codable {
    let temp: Double?
    let pressure, humidity: Int?
    let tempMin, tempMax: Double?
    
    enum CodingKeys: String, CodingKey {
        case temp, pressure, humidity
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.sysTask(with: url) { sys, response, error in
//     if let sys = sys {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Sys
struct Sys: Codable {
    let type, id: Int?
    let message: Double?
    let country: String?
    let sunrise, sunset: Int?
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.weatherTask(with: url) { weather, response, error in
//     if let weather = weather {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Weather
struct Weather: Codable {
    let id: Int?
    let main, weatherDescription, icon: String?
    
    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.windTask(with: url) { wind, response, error in
//     if let wind = wind {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Wind
struct Wind: Codable {
    let speed, deg: Double?
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - URLSession response handlers

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }
    
    func cityTask(with url: URL, completionHandler: @escaping (City?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}
