//
//  BannerViewModel.swift
//  Caloriee
//
//  Created by Ben Haefner on 8/3/25.
//
import SwiftUI

extension BannerView{
    @Observable
    class ViewModel {
        var bannerData: BannerData

        init(title: String, message: String, color: Color) {
            self.bannerData = BannerData(title: title, message: message, color: color)
        }
    }
}
