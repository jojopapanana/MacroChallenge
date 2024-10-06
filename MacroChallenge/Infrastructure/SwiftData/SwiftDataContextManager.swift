//
//  SwiftDataContextManager.swift
//  MacroChallenge
//
//  Created by Jovanna Melissa on 03/10/24.
//

import Foundation
import SwiftData

public class SwiftDataContextManager {
    public static var shared = SwiftDataContextManager()
    var container: ModelContainer?
    var context: ModelContext?

    init() {
        do {
            container = try ModelContainer(for: ClothesLocalEntity.self)
            if let container {
                context = ModelContext(container)
            }
        } catch {
            debugPrint("Error initializing database container:", error)
        }
    }
}
