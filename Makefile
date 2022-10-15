flags := --log-level warn
srcs := $(find src)
statics := $(find static)

.PHONY: all build clean serve

all: build

build: out

clean:
	@mksite $(flags) clean

serve: clean build
	@darkhttpd out/

out: $(srcs) $(statics)
	@mksite $(flags) build
