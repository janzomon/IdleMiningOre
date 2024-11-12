//
//  Structs.swift
//  IdleMiningOre
//
//  Created by Damon gonzalez on 11/11/24.
//

import Foundation
import SwiftUI



class User:ObservableObject {
    @Published var gold:Int = 100
    @Published var miningLevel:Int = 1
    @Published var xpGain:Double = 1 //xp gained normally
    @Published var xpMiningGain:Double = 1 //xp gained when mining
    @Published var minimumMiningExperience:Double = 0 //current earned xp
    @Published var maximumMiningExperience:Double = 100 //xp needed to increase miningLevel
    @Published var PickaxeEquipped:Pickaxe = Pickaxe()
}






struct Pickaxe:Identifiable{
    let id = UUID()
    var name:String = "Basic Pickaxe"
    var image:UIImage = .pickaxe
    var minimumDurability:Double = 50
    var maximumDurability:Double = 50
    var effect:Effects = .none
}
