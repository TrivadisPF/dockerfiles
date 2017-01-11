# DataStax Graph Loader Docker
The git repo for running an instance of DataStax Graph Loader in Docker.

As the image is using software from DataStax, it can not be provided on Docker Hub and you have to build it yourself. The easiest way to use it is through docker-compose running it together with a DSE container. You can find a sample docker-compose file [here][dockercompose]

## Downloading and Building DataStax Graph Loader image

1. First download the software into the folder where the Dockerfile resides. Replace &lt;username&gt; and &lt;password&gt; by your DataStax credentials.

    	$ curl --user <uzsername>:<password> -L http://downloads.datastax.com/enterprise/dse-graph-loader-5.0.5-bin.tar.gz > dse-graph-loader-5.0.5-bin.tar.gz

2. Now you can build it using the following command. 

    	$ docker build --build-arg DSE_GRAPHLOADER_VERSION=5.0.5 -t trivadisbds/dse-graphloader -t trivadisbds/dse-graphloader:5.0.5 .

[whitepaper]: http://www.datastax.com/wp-content/uploads/resources/DataStax-WP-Best_Practices_Running_DSE_Within_Docker.pdf
[hub]: https://hub.docker.com/r/trivadisbds/dse/
[dockercompose]: https://github.com/TrivadisBDS/dockerfiles/tree/master/datastax
