#!/bin/bash

DATABASE_URL="sqlite:///tmp/test.db"

sequel -E -m /app/migrations $DATABASE_URL

rspec
