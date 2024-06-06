//
//  boxOfficeData.swift
//  YegrAPIMiniProject
//
//  Created by YJ on 6/6/24.
//

import UIKit

struct BoxOffice: Decodable {
    let boxOfficeResult: BoxOfficeResult
}

struct BoxOfficeResult: Decodable {
    let boxofficeType: String
    let showRange: String
    let dailyBoxOfficeList: [DailyBoxOfficeList]
}

struct DailyBoxOfficeList: Decodable {
    let rank: String // 랭크
    let movieNm: String // 영화 이름
    let openDt: String // 개봉일
}
