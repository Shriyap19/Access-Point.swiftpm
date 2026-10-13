import SwiftUI

@available(iOS 17.0, *)
@main
struct MyApp: App {
    
    private let coreDataStack = CoreDataStack.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
//                .environment(
//                    \.managedObjectContext,
//                    coreDataStack.persistentContainer.viewContext
//                )
        }
    }
}
