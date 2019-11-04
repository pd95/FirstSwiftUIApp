# Reengineering of the WWDC demo app shown at session "Introducing SwiftUI: Building Your First App"

During session 204 "Introducing SwiftUI: Building Your First App", an App has been presented to illustrate the power of SwiftUI. Sadly the code was not published and as the APIs in SwiftUI have evolved since the early seeds in July 2019, parts of the application have to be adapted to be comilable on todays Xcode 11.2.

As I haven't found the example code somewhere to download, and it seems as if nobody really documented the necessary adaptions to make the demo application run on todays systems, I've been working on this, in the hope other SwiftUI developers can benefit of it.

In contrast to what is shown [@WWDC 2019](https://developer.apple.com/videos/play/wwdc2019/204), the following adaptions have to be made:

- `ContentView.swift`
    - `.listStyle(.grouped)` does not exist and has to be written as `.listStyle(GroupedListStyle())`
    - `NavigationButton` (used to push the detail view) has been renamed to `NavigationLink`
    - `ObjectBinding` has been replaced by `ObservedObject`

- `RoomStore.swift`
    - `BindableObject` is now `ObservableObject`
    - `didChange / didSet` or `willChange / willSet` along with the `PassthroughSubject` is not necessary to notify SwiftUI/Combine. The corresponding property can be marked with `@Published` and the notifyer will get generated.

- `RoomDetail.swift`
    - `tapAction` (to zoom the image in the `RoomDetail` view), has been renamed to `onTapGesture`
    - Custom animation duration with `withAnimation` `.basic` does not exist, `.linear` or `.easeInOut` can be used as replacement.  

- `Localizable.string*`: 
    - as I do not have an Arabic translator at hand, I've simply enabled german translations.
    - Please be aware that the plural localisations (`%lld people` in `Localizable.stringsdict`) are currently not used/functional in the SwiftUI preview within Xcode. You will have to run the application in the simulator to see the proper translations. 
