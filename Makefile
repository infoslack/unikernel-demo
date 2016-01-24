.PHONY: all pull clean realclean rundns

all:
	make -C nginx

pull:
	docker pull mato/rumprun-packages-hw-x86_64:dceu2015-demo

clean:
	make -C nginx clean

realclean: clean
	-docker rmi -f unikernel/nginx

rundns:
	docker run -d --hostname resolvable \
	    -v /var/run/docker.sock:/tmp/docker.sock \
	    -v /etc/resolv.conf:/tmp/resolv.conf mgood/resolvable
