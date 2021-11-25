//
//  FakeAutocompleteProvider.swift
//  PerLuKeyboard
//
//  Created by Rizky Mashudi on 25/11/21.
//

import Foundation
import KeyboardKit

class FakeAutocompleteProvider: AutocompleteProvider {
    
    var locale: Locale = .current
    
    var canIgnoreWords: Bool { false }
    var canLearnWords: Bool { false }
    var ignoredWords: [String] = []
    var learnedWords: [String] = []
    
    func hasIgnoredWord(_ word: String) -> Bool { false }
    func hasLearnedWord(_ word: String) -> Bool { false }
    func ignoreWord(_ word: String) {}
    func learnWord(_ word: String) {}
    func removeIgnoredWord(_ word: String) {}
    func unlearnWord(_ word: String) {}
    
    func autocompleteSuggestions(for text: String, completion: AutocompleteCompletion) {
        guard text.count > 0 else { return completion(.success([])) }
        completion(.success(suggestions(for: text)))
    }
}

private extension FakeAutocompleteProvider {
    
    func suggestions(for text: String) -> [AutocompleteSuggestion] {
        [
            suggestion(text + "ly"),
            suggestion(text + "er", "Subtitle"),
            suggestion(text + "ter")
        ]
    }
    
    func suggestion(_ word: String, _ subtitle: String? = nil) -> AutocompleteSuggestion {
        StandardAutocompleteSuggestion(text: word, title: word, subtitle: subtitle)
    }
}
