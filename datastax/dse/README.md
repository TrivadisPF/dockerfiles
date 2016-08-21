# DataStax Enterprise Docker
This image is based on the version Luke Tillman created [here][luke]. 

> **Note:** Not meant for production use. See [this whitepaper on DataStax.com][whitepaper]
> for details on setting up DSE and Docker in production.

The git repo for running an instance of DataStax Enterprise in Docker. See the  `DESCRIPTION.md` file for the full readme on how to use this Docker image.

As the image is using software from DataStax, it can not be provided on Docker Hub and you have to build it yourself. 

First download the software into the folder where the Dockerfile resides. 

    $ curl --user <username>:<password> -L http://downloads.datastax.com/enterprise/dse-5.0.2-bin.tar.gz > dse-5.0.2-bin.tar.gz

Now you can build it using the following command. 

    $ docker build --build-arg DSE_VERSION=5.0.2 -t trivadisbds/dse -t trivadisbds/dse:5.0.2 .

[whitepaper]: http://www.datastax.com/wp-content/uploads/resources/DataStax-WP-Best_Practices_Running_DSE_Within_Docker.pdf
[hub]: https://hub.docker.com/r/trivadisbds/dse/
[luke]: https://github.com/LukeTillman/dse-docker
