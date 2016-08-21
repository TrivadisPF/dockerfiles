# DataStax Studio Docker
The git repo for running an instance of DataStax Studio in Docker.

As the image is using software from DataStax, it can not be provided on Docker Hub and you have to build it yourself. The easiest way to use it is through docker-compose running it together with a DSE container. You can find a sample docker-compose file [here][dockercompose]

## Downloading and Building DataStax Studio

1. First download the software into the folder where the Dockerfile resides. Replace <username> and <password> by your DataStax credentials.

    	$ curl --user guido.schmutz_trivadis.com:UUz0l29fkAKQarj -L http://downloads.datastax.com/enterprise/datastax-studio-1.0.0.tar.gz > datastax-studio-1.0.0.tar.gz

2. Now you can build it using the following command. 

    	$ docker build --build-arg DSE_STUDIO_VERSION=1.0.0 -t trivadisbds/dse-studio -t trivadisbds/dse-studio:1.0.0 .

[whitepaper]: http://www.datastax.com/wp-content/uploads/resources/DataStax-WP-Best_Practices_Running_DSE_Within_Docker.pdf
[hub]: https://hub.docker.com/r/trivadisbds/dse/
[dockercompose]: https://github.com/TrivadisBDS/dockerfiles/tree/master/datastax