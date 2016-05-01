#!/usr/bin/env bash

VERSION=latest

docker build -t="trivadisbds/storm:$VERSION" storm
docker build -t="trivadisbds/storm-nimbus:$VERSION" storm-nimbus
docker build -t="trivadisbds/storm-supervisor:$VERSION" storm-supervisor
docker build -t="trivadisbds/storm-ui:$VERSION" storm-ui
