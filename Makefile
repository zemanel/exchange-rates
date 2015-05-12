
test:
	fig run -e DATABASE_URL="sqlite:///tmp/test.db" web "/app/scripts/test.sh"
