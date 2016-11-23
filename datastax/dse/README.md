# DataStax Enterprise Docker
This image is based on the version Luke Tillman created [here][luke]. 

> **Note:** Not meant for production use. See [this whitepaper on DataStax.com][whitepaper]
> for details on setting up DSE and Docker in production.

The git repo for running an instance of DataStax Enterprise in Docker. See the  `DESCRIPTION.md` file for the full readme on how to use this Docker image.

As the image is using software from DataStax, it can not be provided on Docker Hub and you have to build it yourself. 

## Downloading and Building DSE

1. First download the software into the folder where the Dockerfile resides. Replace &lt;username&gt; and &lt;password&gt; by your DataStax credentials.

    	$ curl --user <username>:<password> -L http://downloads.datastax.com/enterprise/dse-5.0.4-bin.tar.gz > dse-5.0.4-bin.tar.gz

2. Now you can build it using the following command. 

    	$ docker build --build-arg DSE_VERSION=5.0.4 -t trivadisbds/dse -t trivadisbds/dse:5.0.4 .

[whitepaper]: http://www.datastax.com/wp-content/uploads/resources/DataStax-WP-Best_Practices_Running_DSE_Within_Docker.pdf
[hub]: https://hub.docker.com/r/trivadisbds/dse/
[luke]: https://github.com/LukeTillman/dse-docker
