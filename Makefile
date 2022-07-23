BUILD_TARGET := web-server

.PHONY: all
all: run

$(BUILD_TARGET):
	@go build -o $(BUILD_TARGET) .

.PHONY: run
run: $(BUILD_TARGET)
	@sudo ./$(BUILD_TARGET)

.PHONY: clean
clean:
	@rm -vf $(BUILD_TARGET)
