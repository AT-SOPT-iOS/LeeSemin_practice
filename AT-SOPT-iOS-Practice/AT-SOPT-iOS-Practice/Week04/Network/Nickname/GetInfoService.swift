//
//  GetInfoService.swift
//  AT-SOPT-iOS-Practice
//
//  Created by 이세민 on 5/3/25.
//

import Foundation

final class GetInfoService {
    
    static let shared = GetInfoService()
    private init() {}
    
    private func makeNicknameListRequest(keyword: String?) -> URLRequest? {
        var urlString = "https://api.atsopt-seminar4.site/api/v1/users"
        
        if let keyword = keyword, !keyword.isEmpty,
           let encoded = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            urlString += "?keyword=\(encoded)"
        }
        
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    private func makeMyNicknameRequest(userId: Int) -> URLRequest? {
        guard let url = URL(string: "https://api.atsopt-seminar4.site/api/v1/users/me") else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("\(userId)", forHTTPHeaderField: "userId")
        return request
    }
    
    private func fetchNickname<T: Codable>(request: URLRequest, modelType: T.Type) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.responseError
        }
        
        do {
            let decoded = try JSONDecoder().decode(NicknameResponseWrapper<T>.self, from: data)
            return decoded.data
        } catch {
            print("디코딩 실패: ", error)
            throw NetworkError.responseDecodingError
        }
    }
    
    func fetchNicknameList(keyword: String?) async throws -> [String] {
        guard let request = makeNicknameListRequest(keyword: keyword) else {
            throw NetworkError.requestEncodingError
        }
        let result: NicknameListResponseModel = try await fetchNickname(request: request, modelType: NicknameListResponseModel.self)
        return result.nicknameList
    }
    
    func fetchMyNickname(userId: Int) async throws -> String {
        guard let request = makeMyNicknameRequest(userId: userId) else {
            throw NetworkError.requestEncodingError
        }
        let result: NicknameResponseModel = try await fetchNickname(request: request, modelType: NicknameResponseModel.self)
        return result.nickname
    }
}
