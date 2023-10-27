ROOT_DIR=$(shell pwd)

MODULE_NAME=grocery-be
SERVICE=service
SERVICE_DIR=$(ROOT_DIR)/$(SERVICE)
API_DIR=$(ROOT_DIR)/api
MIGRATION_DIR=$(ROOT_DIR)/migration
DATASOURCE=postgres://thopb:DOdlP6lz683mVfIAdF6eb15bSmMHK31E@dpg-cktnb2enfb1c73fmf7q0-a.singapore-postgres.render.com/grocery_db_s5od
# DATASOURCE=postgres://thopb:524020@localhost:5432/grocery_db?sslmode=disable

# account service 
ACCOUNT=account_tbl
ACCOUNT_DIR=$(SERVICE_DIR)/account
ACCOUNT_API_DIR=$(ACCOUNT_DIR)/api
ACCOUNT_MODEL_DIR=$(ACCOUNT_DIR)/model

dep-init:
	go mod init $(MODULE_NAME)
	go mod tidy


dep:
	go mod tidy

#gen api code
gen-account-service:
	goctl api go -api $(API_DIR)/account.api -dir $(ACCOUNT_API_DIR)

# migrate 
migrate:
	migrate create -ext sql -dir ${MIGRATION_DIR} -seq account_init
migrateup:
	migrate -path ${MIGRATION_DIR} -database "${DATASOURCE}" -verbose up
migratedown:
	migrate -path ${MIGRATION_DIR} -database "${DATASOURCE}" -verbose down

# gen db model
gen-account-model: 
	goctl model pg datasource -url="${DATASOURCE}" -table="${ACCOUNT}" -dir="$(ACCOUNT_MODEL_DIR)"

gen-models: gen-account-model gen-result-model gen-progress-model gen-topic-model

runs:
	go run main.go -f etc/server.yaml