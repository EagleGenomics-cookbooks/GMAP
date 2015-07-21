# GMAP

Description
===========

Cookbook for installing GMAP (Genomic Mapping and Alignment Program for mRNA and EST Sequences): a standalone program for mapping and aligning cDNA sequences to a genome. http://research-pub.gene.com/gmap/ 
Installs a specific vesion of GMAP, mainly to support deFuse on RHEL 6.5.

Requirements
============

## Platform:

* Centos 6.5


Usage
=====

Include this recipe to install GMAP.

    include_recipe "GMAP::source"

Attributes
==========

See attributes/default.rb for default values.

    default['GMAP']['version']

Currently this is a build from 2013-11-27.

License and Authors
===================

* Authors:: Daniel Barrell (<daniel.barrell@eaglegenomics.com>)
* Authors:: Nick James (<nick.james@eaglegenomics.com>)

Copyright:: 2015, Eagle Genomics.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
