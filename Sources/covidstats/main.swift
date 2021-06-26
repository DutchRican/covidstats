import Foundation
import SwiftyTextTable

// If you prefer writing in a "script" style, you can call `parseOrExit()` to
// parse a single `ParsableArguments` type from command-line arguments.
let options = CovstatsOptions.parseOrExit()

requestor(target: "https://www.worldometers.info/coronavirus/") { answer in

  var result = htmlParser(htmlString: answer).sorted { $0.totalCases > $1.totalCases }
  if !options.showWorld { result.removeFirst()}

  let headers = [
    TextTableColumn(header: "Country"),
    TextTableColumn(header: "Total Cases"),
    TextTableColumn(header: "New Cases"),
    TextTableColumn(header: "Total Deaths"),
    TextTableColumn(header: "New Deaths"),
    TextTableColumn(header: "Total Recovered"),
    // TextTableColumn(header: "New Recovered"),
    TextTableColumn(header: "Active Cases"),
    // TextTableColumn(header: "Serious/Critical"),
    // TextTableColumn(header: "Cases per 1M"),
    // TextTableColumn(header: "Deaths per 1M"),
    TextTableColumn(header: "Total Tests"),
    // TextTableColumn(header: "Tests per 1M"),
    // TextTableColumn(header: "Population"),
    // TextTableColumn(header: "Continent")
  ]

  var table = TextTable(columns: headers)
  table.header = "Source: www.worldometers.info as of \(Date())"
  for line in result.prefix(options.top) {
    table.addRow(values: line.toArray())
  }
  print("\n")
  print(table.render(), "\n")
  exit(0)
}

RunLoop.main.run()
