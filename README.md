# covidstats

Pulling covid data information from [Worldometers Coronavirus](https://www.worldometers.info/coronavirus/)

## build -- on MacOs

`swift build -c release`

move it to a location to easily execute it:  
`sudo cp ./.build/release/covidstats /usr/local/bin/`


## run 

To see the full table with all countries  
`covidstats`

Specify if the count  
`covidstats --top 10`


Not include the world stats  
`covidstats --show-world false`

