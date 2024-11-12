# IdleMiningOre
An Idle-esque Ore mining Game with upgrades to pickaxe and leveling


## Contents
- [Add Package](https://github.com/janzomon/IdleMiningOre#package)
- [Basic Usage](https://github.com/janzomon/IdleMiningOre#basic-usage)
- [ContentView](https://github.com/janzomon/IdleMiningOre#contentview)
- [PickaxeUpgradeView](https://github.com/janzomon/IdleMiningOre#pickaxeupgradeview)
- [Supplemental](https://github.com/janzomon/IdleMiningOre#supplemental)
- [Images](https://github.com/janzomon/IdleMiningOre#images)
- [Future](https://github.com/janzomon/IdleMiningOre#future)
- [Feedback](https://github.com/janzomon/IdleMiningOre#feedback)


## Package
**For Xcode Projects**

File > Swift Packages > Add Package Dependency: [https://github.com/janzomon/IdleMiningOre.git](https://github.com/janzomon/IdleMiningOre.git)

## Basic Usage

1. Add package to project
2. `Import IdleMiningOre`
3. Call `IdleMiningOre()`



## ContentView

-Main view that handles mining Ore

1. `@State var copperMiningLevel:Int = 1`
  - Tracks mining level of copper mining
3. `@State var copperMinimumMiningLevel:Int = 1`
  - Tracks minimum mining level to mine copper ore
5. `@State var copperMinimumMining:Double = 0`
  - tracks current xp gain while mining copper
  - used with `struct MiningProgressBar:ProgressViewStyle`
6. `@State var copperMaximumMining:Double = 50`
  - tracks the maximum xp needed to level up copper mining
  - used with `struct MiningProgressBar:ProgressViewStyle`
7. `@State var copperMiningDurabilityReduction:Double = 0.1`
  - tracks how much durability is subtracted from user.PickaxeEquipped.minimumDurability
8. `@State var copperMiningTime = DispatchTimeInterval.seconds(1)`
  -to control speed of progressview for copper mining
  - used in `func copperMining()`
9. `@State var copperMined:Int = 0`
  - tracks copper ore mined


## PickaxeUpgradeView

-View that handles upgrading User Pickaxe

1. `@ObservedObject var user:User`
   - object observed to keep user data tracked between views
2. `@State private var repairStartShake: Bool = false`
   - used to trigger shake animation for repair button
3. `@State private var upgradeStartShake: Bool = false`
   - used to trigger shake animation for repair button
4. `@State private var copperStartShake: Bool = false`
   - used to trigger shake animation for repair button
5. `@State private var tinStartShake: Bool = false`
   - used to trigger shake animation for repair button
6. `@State private var ironStartShake: Bool = false`
    - used to trigger shake animation for repair button
7. `@State private var goldStartShake: Bool = false`
    - used to trigger shake animation for repair button
8. `@State private var mithrilStartShake: Bool = false`
    - used to trigger shake animation for repair button
9. `@State private var eterniumStartShake: Bool = false`
    - used to trigger shake animation for repair button
10. `@State private var obsidianStartShake: Bool = false`
    - used to trigger shake animation for repair button
11. `@State private var empyriumStartShake: Bool = false`
    - used to trigger shake animation for repair button
12. `@State private var oexxeinStartShake: Bool = false`
    - used to trigger shake animation for repair button
13. `@State private var progreniumStartShake: Bool = false`
    - used to trigger shake animation for repair button


## Supplemental
1. `Structs`
   -`class User:ObservableObject`
     - user class that tracks user: gold, miningLevel, xpGain, xpMiningGain, minimumMiningExperience. maximumMiningExperience, PickaxeEquipped
   - `struct Pickaxe:Identifiable`
     - pickaxe structure with properties: id, name, image, minimumDurability, maximumDurability
3. `Enums`
   - `Ores`
     - defines ores used with mining
   - `Effects`
     - defines effects used for pickaxe


## Images
![Simulator Screenshot - iPhone 16 Pro Max - 2024-11-11 at 19 22 54](https://github.com/user-attachments/assets/437ae47b-944a-420c-bdef-92ffaa19e5a1)
![Simulator Screenshot - iPhone 16 Pro Max - 2024-11-11 at 19 23 09](https://github.com/user-attachments/assets/f20bbf0f-6549-4887-a325-e322414fde9a)




 ## Future

 1. Adopt Core Data
 2. Future Pickaxe effects

## Feedback

Please feel FREE to conatct me with feedback or anything else here on github or my email [damon.r.gonzalez@gmail.com](mailto:damon.r.gonzalez@gmail.com)

