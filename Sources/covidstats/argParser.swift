import ArgumentParser

struct CovstatsOptions: ParsableArguments {
  @Option(help: ArgumentHelp("Show to <n> countries", valueName: "n"))
  var top = 10

  @Option(help: ArgumentHelp("Include World stats", valueName: "w"))
  var showWorld = true
}