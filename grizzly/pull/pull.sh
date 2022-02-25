#! /usr/bin/env bash

rm -rf ../folders ../dashboards ../datasources

grr pull \
-d ../folders \
-t "DashboardFolder/*"

grr pull \
-d ../dashboards \
-t "Dashboard/*"

grr pull \
-d ../datasources \
-t "Datasource/*"