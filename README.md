# Ironmon Tracker Logger
A logger for the [Ironmon Tracker](https://github.com/besteon/Ironmon-Tracker).

Warning: not production-ready. Only tested on the GrandPooBear DrCeil patch of FireRed. Support for other versions is unlikely

## Usage
- Start Bizhawk
- Load the Ironmon-Tracker script
- Load the Ironmon-Tracker-Logger script
- Load a ROM

Logs are output to `./logs`

## Logparser
In ./logparser there are 2 simple log parsers using nodejs

- Run `npm run server` for a local webserver that parses the created logs. Reach at http://localhost:3000
- Run `npm run csv` to generate a CSV file from created logs in the `./logs` folder. CSV is output to `./logs/seedlogs.csv`

## Known issues
- Quick load of next rom stops the logger. Need to activate it again for each seed
