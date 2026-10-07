# Kuwait Airways API (KU / KAC) - Flight Tracking, Schedules, Routes & Fleet

Track **Kuwait Airways** (IATA `KU`, ICAO `KAC`, Kuwait) flights programmatically - real-time status and positions, live schedules, routes and fleet data - through a single [AirLabs API](https://airlabs.co/) integration.

This repo has ready-to-run examples (cURL, Python, Node.js) that pull Kuwait Airways data by its airline code `KU`. Change the code and the same examples work for any of the 1,000+ airlines AirLabs covers.

> **Full reference:** [Kuwait Airways Developer API](https://airlabs.co/kuwait-airways-developer-api)
> **Free API key:** [airlabs.co/signup](https://airlabs.co/signup)

## What you can pull for Kuwait Airways

| Data | AirLabs endpoint | Filter |
| --- | --- | --- |
| Live flights & positions | [Real-Time Flights](https://airlabs.co/docs/flights) | `airline_iata=KU` |
| Live departures / arrivals | [Schedules](https://airlabs.co/docs/schedules) | `airline_iata=KU` |
| Single flight status | [Flight Info](https://airlabs.co/docs/flight) | `flight_iata=KU...` |
| Route network | [Routes](https://airlabs.co/docs/routes) | `airline_iata=KU` |
| Fleet (aircraft) | [Fleets](https://airlabs.co/docs/fleets) | `airline_iata=KU` |
| Airline record (codes, callsign) | [Airlines DB](https://airlabs.co/docs/airlines) | `iata_code=KU` |

## Quickstart

### cURL
```bash
curl "https://airlabs.co/api/v9/flights?airline_iata=KU&api_key=YOUR_API_KEY"
```

### Python
```python
import requests

API_KEY = "YOUR_API_KEY"
BASE = "https://airlabs.co/api/v9"

flights = requests.get(f"{BASE}/flights", params={
    "airline_iata": "KU",
    "api_key": API_KEY,
}).json()["response"]

for f in flights:
    ident = f.get("flight_iata") or f.get("flight_icao") or f.get("reg_number") or "?"
    print(f"{ident}  {f.get('dep_iata','?')}->{f.get('arr_iata','?')}  {f.get('status','')}")
```

### Node.js
```js
const API_KEY = "YOUR_API_KEY";
const BASE = "https://airlabs.co/api/v9";

const res = await fetch(`${BASE}/flights?airline_iata=KU&api_key=${API_KEY}`);
const { response: flights } = await res.json();
flights.forEach(f => {
  const ident = f.flight_iata ?? f.flight_icao ?? f.reg_number ?? "?";
  console.log(`${ident}  ${f.dep_iata ?? "?"}->${f.arr_iata ?? "?"}  ${f.status ?? ""}`);
});
```

## Example response (shape)

Placeholder values. See the [Schedules API docs](https://airlabs.co/docs/schedules) for the full field list; live values vary by flight.

```json
{
  "airline_iata": "KU",
  "airline_icao": "KAC",
  "flight_iata": "KUxxxx",
  "dep_iata": "XXX",
  "dep_time": "YYYY-MM-DD HH:MM",
  "dep_time_utc": "YYYY-MM-DD HH:MM",
  "arr_iata": "YYY",
  "arr_time": "YYYY-MM-DD HH:MM",
  "arr_estimated": "YYYY-MM-DD HH:MM",
  "status": "scheduled",
  "duration": 0,
  "dep_delayed": null,
  "arr_delayed": null
}
```

Every time field also comes as UTC (`_utc`) and a Unix timestamp (`_ts`).

## Use cases

- Flight-tracker / status pages featuring Kuwait Airways (`KU`) flights
- Travel apps showing KU schedules, routes and live ETAs
- Operational dashboards, delay monitoring and alerts
- Enriching bookings with aircraft, route and fleet data

## Get started

1. Get a **free API key** at [airlabs.co/signup](https://airlabs.co/signup)
2. Clone this repo and drop your key into the examples in [`/examples`](./examples)
3. Read the full [Kuwait Airways API reference](https://airlabs.co/kuwait-airways-developer-api) and the [AirLabs docs](https://airlabs.co/docs/)

## About

[AirLabs](https://airlabs.co/) is a global aviation data provider - real-time flights, schedules, delays, airports, airlines, routes and fleets through one REST API (JSON / XML / CSV). More airline examples: [airlabs.co/blog](https://airlabs.co/blog).

## License

MIT - see [LICENSE](LICENSE). Not affiliated with or endorsed by Kuwait Airways; "Kuwait Airways" is a trademark of its owner. This repo shows how to access publicly available flight data via the AirLabs API.
