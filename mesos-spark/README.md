# Mesos Spark

Spark for mesos.

## Usage

Docker images are tagged by spark versions.

The Master URLs for Mesos are in the form mesos://host:5050
for a single-master Mesos cluster, or mesos://zk://host:2181
for a multi-master Mesos cluster using ZooKeeper.

Spark distribution url should point to spark distribution
for your version of spark. You can obtain url from
spark download page or host it yourself (preferred option).
Note that you need compiled spark version, not source code.


### Spark shell

```
docker run --rm -t -i --net=host bobrik/mesos-spark:1.1.1 /opt/spark/bin/spark-shell \
  --master <mesos master> --conf spark.executor.uri=<spark distribution url>
```

Check that everything works as expected:

```scala
sc.parallelize(1 to 1000).count()
```

### Spark submit

```
docker run --rm --net=host -v /app/on/host:/app/in/docker bobrik/mesos-spark:1.1.1 \
  /opt/spark/bin/spark-submit --master <mesos master> \
  --conf spark.executor.uri=<spark distribution url> /app/in-docker
```

Here `/app/on/host` could be java, scala or python app. You should
check out [docs](https://spark.apache.org/docs/latest/quick-start.html) for examples.

Note that for java you also need to specify `--class`.
