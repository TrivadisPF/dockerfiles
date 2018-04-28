# Docker + JanusGraph

## Introduction

Docker container images for [JanusGraph](http://janusgraph.org/).

## Usage

### Standalone
```
$ docker run -ti swayai/janusgraph:0.1.1
MMM DD, YYYY HH:MM:SS AM/PM java.util.prefs.FileSystemPreferences$1 run
INFO: Created user preferences directory.

         \,,,/
         (o o)
-----oOOo-(3)-oOOo-----
plugin activated: janusgraph.imports
plugin activated: tinkerpop.server
plugin activated: tinkerpop.utilities
SLF4J: Class path contains multiple SLF4J bindings.
SLF4J: Found binding in [jar:file:/janusgraph-0.1.1-hadoop2/lib/slf4j-log4j12-1.7.12.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/janusgraph-0.1.1-hadoop2/lib/logback-classic-1.1.2.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
SLF4J: Actual binding is of type [org.slf4j.impl.Log4jLoggerFactory]
21:41:28 WARN  org.apache.hadoop.util.NativeCodeLoader  - Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
plugin activated: tinkerpop.hadoop
plugin activated: tinkerpop.spark
plugin activated: tinkerpop.tinkergraph
gremlin>
```

### Connected to Cassandra and Solr containers

#### Setup

```
### Start Apache Cassandra:
$ docker run --rm --name cass -d --net=host --hostname=localhost -e CASSANDRA_LISTEN_ADDRESS='127.0.0.1' cassandra:3.10
### Wait a few seconds for Cassandra to be ready and run the below, as JanusGraph requires the Thrift API to be enabled:
$ docker exec -ti cass nodetool enablethrift

### Start Apache Solr:
$ docker run --rm --name solr -d --net=host --hostname=localhost swayai/solr:5.5.4

### Start JanusGraph:
$ docker run --rm --name janus -ti --net=host --hostname=localhost swayai/janusgraph:0.1.1
[...]
gremlin> graph = JanusGraphFactory.open('conf/janusgraph-cassandra-solr.properties')
==>standardjanusgraph[cassandrathrift:[127.0.0.1]]
```

#### Example: Graph of the Gods

```
gremlin> GraphOfTheGodsFactory.load(graph)
==>null
gremlin> g = graph.traversal()
==>graphtraversalsource[standardjanusgraph[cassandrathrift:[127.0.0.1]], standard]
gremlin> saturn = g.V().has('name', 'saturn').next()
==>v[4152]
gremlin> g.V(saturn).valueMap()
==>[name:[saturn],age:[10000]]
gremlin> g.V(saturn).in('father').in('father').values('name')
==>hercules
gremlin> g.E().has('place', geoWithin(Geoshape.circle(37.97, 23.72, 50)))
==>e[2pkw-6bk-9hx-3aw][8192-battled->4280]
==>e[2pz4-6bk-9hx-6dc][8192-battled->8256]
gremlin> g.E().has('place', geoWithin(Geoshape.circle(37.97, 23.72, 50))).as('source').inV().as('god2').select('source').outV().as('god1').select('god1', 'god2').by('name')
==>[god1:hercules,god2:nemean]
==>[god1:hercules,god2:hydra]
gremlin> hercules = g.V(saturn).repeat(__.in('father')).times(2).next()
==>v[8192]
gremlin> g.V(hercules).out('father', 'mother')
==>v[4328]
==>v[8424]
gremlin> g.V(hercules).out('father', 'mother').values('name')
==>jupiter
==>alcmene
gremlin> g.V(hercules).out('father', 'mother').label()
==>god
==>human
gremlin> hercules.label()
==>demigod
gremlin> g.V(hercules).out('battled')
==>v[4280]
==>v[8256]
==>v[8376]
gremlin> g.V(hercules).out('battled').valueMap()
==>[name:[nemean]]
==>[name:[hydra]]
==>[name:[cerberus]]
gremlin> g.V(hercules).outE('battled').has('time', gt(1)).inV().values('name')
==>cerberus
==>hydra
gremlin> g.V(hercules).outE('battled').has('time', gt(1)).inV().values('name').toString()
==>[GraphStep(vertex,[v[8192]]), VertexStep(OUT,[battled],edge), HasStep([time.gt(1)]), EdgeVertexStep(IN), PropertiesStep([name],value)]
gremlin> pluto = g.V().has('name', 'pluto').next()
==>v[4344]
gremlin> g.V(pluto).out('lives').in('lives').values('name')
==>pluto
==>cerberus
gremlin> g.V(pluto).out('lives').in('lives').where(is(neq(pluto))).values('name')
==>cerberus
gremlin> g.V(pluto).as('x').out('lives').in('lives').where(neq('x')).values('name')
==>cerberus
gremlin> g.V(pluto).out('brother').out('lives').values('name')
==>sea
==>sky
gremlin> g.V(pluto).out('brother').as('god').out('lives').as('place').select('god', 'place')
==>[god:v[4160],place:v[4096]]
==>[god:v[4328],place:v[4336]]
gremlin> g.V(pluto).out('brother').as('god').out('lives').as('place').select('god', 'place').by('name')
==>[god:neptune,place:sea]
==>[god:jupiter,place:sky]
gremlin> g.V(pluto).outE('lives').values('reason')
==>no fear of death
gremlin> g.E().has('reason', textContains('loves'))
==>e[3z1-3c8-b2t-3cg][4328-lives->4336]
==>e[360-37k-b2t-35s][4160-lives->4096]
gremlin> g.E().has('reason', textContains('loves')).as('source').values('reason').as('reason').select('source').outV().values('name').as('god').select('source').inV().values('name').as('thing').select('god', 'reason', 'thing')
==>[god:jupiter,reason:loves fresh breezes,thing:sky]
==>[god:neptune,reason:loves waves,thing:sea]
gremlin>
```

## Build

```
$ curl -fsSO https://github.com/JanusGraph/janusgraph/releases/download/v0.1.1/janusgraph-0.1.1-hadoop2.zip.asc && mv janusgraph-0.1.1-hadoop2.zip.asc signatures/
$ docker build \
    -t swayai/janusgraph:0.1.1 \
    -t swayai/janusgraph:latest \
    --build-arg=jg_version=0.1.1 \
    .
```

## Release

```
$ docker push swayai/janusgraph:0.1.1
$ docker push swayai/janusgraph:latest
```
