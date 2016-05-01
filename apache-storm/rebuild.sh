#!/usr/bin/env bash

VERSION=latest

docker build -t="trivadisbds/apache-storm:$VERSION" storm
docker build -t="trivadisbds/apache-storm-nimbus:$VERSION" storm-nimbus
docker build -t="trivadisbds/apache-storm-supervisor:$VERSION" storm-supervisor
docker build -t="trivadisbds/apache-storm-ui:$VERSION" storm-ui
