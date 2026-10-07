#!/usr/bin/env bash
# Kuwait Airways (KU) - AirLabs API quickstart
KEY="YOUR_API_KEY"
BASE="https://airlabs.co/api/v9"
curl "$BASE/flights?airline_iata=KU&api_key=$KEY"
curl "$BASE/routes?airline_iata=KU&api_key=$KEY"
curl "$BASE/fleets?airline_iata=KU&api_key=$KEY"
