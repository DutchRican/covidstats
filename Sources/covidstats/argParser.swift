import ArgumentParser

let validOptions = "\"North America\", \"South America\", Asia, Europe, Africa, Antarctica, \"Australia/Oceania\""

struct CovstatsOptions: ParsableArguments {
  @Option(name: [.customShort("n"), .long], help: ArgumentHelp("Show to <n> countries"))
  var top = 10

  @Option(name: [.customShort("w"), .long], help: ArgumentHelp("Include World stats"))
  var showWorld = true

  @Option(name: [.customShort("c"), .long], help: ArgumentHelp("Specify the continent \n valid options:\n\(validOptions)"))
  var continent: String = Continents.ALL.rawValue

  mutating func validate() throws {
   guard let _ = Continents.init(rawValue: continent) else {
     throw ValidationError("\nValid options for the continents are: \n\(validOptions) \nDefault is \"All\"\n")
   }
  }
}