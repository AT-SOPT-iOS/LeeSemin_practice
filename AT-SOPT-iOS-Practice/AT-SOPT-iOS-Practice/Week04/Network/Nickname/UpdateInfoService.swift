//
//  UpdateInfoService.swift
//  AT-SOPT-iOS-Practice
//
//  Created by 이세민 on 5/6/25.
//

import Foundation

final class UpdateInfoService {
    
    static let shared = UpdateInfoService()
    private init() {}
    
    func makeRequestBody(nickname: String) -> Data? {
        do {
            let data = UpdateRequestModel(nickname: nickname)
            let jsonEncoder = JSONEncoder()
            let requestBody = try jsonEncoder.encode(data)
            return requestBody
        } catch {
            print(error)
            return nil
        }
    }
    
    private func makeRequest(userId: Int, body: Data?) -> URLRequest {
        let url = URL(string: "https://api.atsopt-seminar4.site/api/v1/users")!
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("\(userId)", forHTTPHeaderField: "userId")
        
        if let body = body {
            request.httpBody = body
        }
        return request
    }
    
    func updateNickname(userId: Int, newNickname: String) async throws -> UpdateResponseModel {
        
        guard let body = makeRequestBody(nickname: newNickname) else {
            throw NetworkError.requestEncodingError
        }
        
        let request = makeRequest(userId: userId, body: body)
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw configureHTTPError(errorCode: httpResponse.statusCode)
        }
        
        do {
            let decoded = try JSONDecoder().decode(UpdateResponseModel.self, from: data)
            return decoded
        } catch {
            print("디코딩 실패: ", error)
            throw NetworkError.responseDecodingError
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode)
        ?? NetworkError.unknownError
    }
}
