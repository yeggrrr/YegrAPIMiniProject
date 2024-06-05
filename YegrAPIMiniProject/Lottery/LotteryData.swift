//
//  LotteryData.swift
//  YegrAPIMiniProject
//
//  Created by YJ on 6/5/24.
//

import UIKit

struct Lottery: Decodable {
    let totSellamnt: Int // 총 판매액
    let returnValue: String // API 응답 성공 여부
    let drwNoDate: String // 추첨일
    let firstWinamnt: Int // 1등 상금
    let drwNo: Int // 회차
    let drwtNo1: Int
    let drwtNo2: Int
    let drwtNo3: Int
    let drwtNo4: Int
    let drwtNo5: Int
    let drwtNo6: Int
    let bnusNo: Int
    let firstPrzwnerCo: Int // 1등 당첨 인원
}
