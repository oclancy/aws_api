
ENV=dev

build:
	dotnet build ${LAMBDA}/src/${LAMBDA}

package:
	dotnet-lambda package -pl ${LAMBDA}/src/${LAMBDA} ${LAMBDA} 

deploy:
	./scripts/deploy.sh $(LAMBDA_PATH)

init:
	terraform -chdir=./deploy/ init -backend-config=${ENV}.backend.tfvars

validate:
	terraform -chdir=./deploy/ validate

plan:
	terraform -chdir=./deploy/ plan -var="lambda_function_name=${LAMBDA}"  -out plan.out -var-file="${ENV}.tfvars"

apply:
	terraform -chdir=./deploy/ apply plan.out