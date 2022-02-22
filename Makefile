dist := dist
bin := juju-api-example

pre:
	mkdir -pv $(dist) 

build: pre
	GOOS="$(shell go env GOOS)" GOARCH="$(shell go env GOARCH)" CGO_ENABLED=0 go build --installsuffix cgo --ldflags '-s'
	mv $(bin) $(dist)/

release: pre
	GOOS="$(shell go env GOOS)" GOARCH="$(shell go env GOARCH)" CGO_ENABLED=0 go build -a --installsuffix cgo --ldflags '-s'
	mv $(bin) $(dist)/

clean:
	rm -rf $(dist)/*