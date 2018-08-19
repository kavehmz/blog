.PHONY: $(shell ls -d *)

build:
	docker build -t hugo .
	docker run --rm --name hugo -ti -v ${PWD}:/site hugo -t temple

serve:
	docker build -t hugo .
	docker run --rm --name hugo -ti -v ${PWD}:/site -p 8080:8080 hugo server --bind 0.0.0.0 -p 8080 -t temple
