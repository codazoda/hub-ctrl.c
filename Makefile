LDLIBS = -lusb
PREFIX = /usr/local


all: hub-ctrl

.PHONY: install
install: hub-ctrl
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	install $< $(DESTDIR)$(PREFIX)/bin/$<

.PHONY: clean
clean:
	rm -f hub-ctrl
