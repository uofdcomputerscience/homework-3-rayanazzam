import Foundation

// This homework should be fairly simple.
// visit https://github.com/noops-challenge/wordbot to read
// the documentation for wordbot.
//
// Using that documentation, write a playground that does
// the following:
// download 50 words
// decode those 50 words into an array of strings
// print the array of words, but with each word reversed
// print the average number of characters per word

//Here is my answer:

struct Words: Codable {
  let names: [String]
}

func printWordsReversed (list: [String]) {
  for word in list {
    print(String (word.reversed()))
  }
}

func printAverageCharacterPerWord (list: [String]) {
  var numCharacters = 0
  for word in list {
    numCharacters = numCharacters + word.count
  }
  print(numCharacters/list.count)50
}
let urlString = "https://api.noopschallenge.com/wordbot?count=50"

if let url = URL (string: urlString) {
  let request = URLRequest(url: url)
  let session = URLSession(configuration: .ephemeral)
  
  let task = session.dataTask(with: request) { (data, response, error) in
    let wordList = try! JSONDecoder().decode (Words.self, from: data!)
    printWordsReversed(list: wordList.names)
    printAverageCharacterPerWord(list: wordList.names)
  }
  task.resume()
}

