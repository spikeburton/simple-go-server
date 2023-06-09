BUILD_TARGET := web-server
INSTALL_PATH := /usr/local/bin

.PHONY: all
all: run

$(BUILD_TARGET):
	@go build -o $(BUILD_TARGET) .

.PHONY: build
build: $(BUILD_TARGET)

.PHONY: install
install: $(BUILD_TARGET)
	@sudo mv -v $(BUILD_TARGET) $(INSTALL_PATH)
	@sudo chmod 0500 $(INSTALL_PATH)/$(BUILD_TARGET)
	@sudo chown root:root $(INSTALL_PATH)/$(BUILD_TARGET)
	@sudo cp -v service/web-server.service /etc/systemd/system
	@sudo systemctl daemon-reload

.PHONY: uninstall
uninstall:
	@sudo systemctl stop web-server.service
	@sudo rm -vf $(INSTALL_PATH)/$(BUILD_TARGET) /etc/systemd/system/web-server.service
	@sudo systemctl daemon-reload

.PHONY: run
run: install
	@sudo systemctl start web-server.service

.PHONY: clean
clean:
	@rm -vf $(BUILD_TARGET)
