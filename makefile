


build:
	dotnet-lambda ./src/TestFunc

deploy:
	./scripts/deploy.sh $(LAMBDA_PATH)

