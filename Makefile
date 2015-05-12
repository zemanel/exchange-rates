
test:
	fig run -e DATABASE_URL="sqlite:///tmp/test.db" web "/app/scripts/test.sh"

irb:
	fig run web irb -I/app/lib

psql:
	fig run web psql -h db -p 5432 -U postgres postgres

index:
	# Imports current rates
	fig run web rake index
