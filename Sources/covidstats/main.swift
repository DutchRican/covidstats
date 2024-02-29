import Foundation
import SwiftyTextTable


let options = CovstatsOptions.parseOrExit()

var response: String;
do {
    response = try await requestor(target: "https://www.worldometers.info/coronavirus/")
    
} catch {
    print("Could not get the data you requested.")
    exit(1)
}

var result = htmlParser(htmlString: response).sorted { $0.totalCases > $1.totalCases }
if !options.showWorld { result.removeFirst() }

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

if options.continent != Continents.ALL.rawValue {
    result = result.filter { $0.continent == options.continent }
}

var table = TextTable(columns: headers)
table.header = "Source: www.worldometers.info as of \(Date())"
for line in result.prefix(options.top) {
    table.addRow(values: line.toArray())
}
print("\n")
print(table.render(), "\n")
exit(0)
