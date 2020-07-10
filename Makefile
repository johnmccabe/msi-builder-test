build:
	GOOS=windows GOARCH=amd64 go build -o msi-builder-test.exe main.go