thrift:
	thrift --gen rb -o /tmp ${HBASE_HOME}/src/main/resources/org/apache/hadoop/hbase/thrift/Hbase.thrift
	mv /tmp/gen-rb/* lib/thrift

clean:
	rm -f *.gem

build:
	/usr/local/bin/gem build ./hbaserb.gemspec

install: build
	/usr/local/bin/gem install ./hbaserb