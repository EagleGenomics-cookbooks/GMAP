require 'serverspec'
require_relative 'spec_helper'

# Required by serverspec
set :backend, :exec

# Check executables and their --version
%w(atoiindex cmetindex get-genome gmap gmap_build gmapl gsnap gsnapl iit_dump iit_get iit_store
   snpindex uniqscan uniqscanl).each do |file_executable|
  describe command("which #{file_executable}") do
    its(:exit_status) { should eq 0 }
  end

  file_path = '/usr/local/bin/' + file_executable

  describe file(file_path) do
    it { should be_file }
    it { should be_executable }
  end

  describe command("#{file_executable} --version") do
    its(:stdout) { should match(/Part of GMAP package, version 2013-11-27/) }
  end
end

# These executables don't take --version arg. Handle differently.
%w(dbsnp_iit ensembl_genes fa_coords gff3_genes gff3_introns gff3_splicesites gmapindex
   gmap_compress gmap_process gmap_reassemble gmap_uncompress gtf_genes gtf_introns gtf_splicesites
   gvf_iit md_coords psl_genes psl_introns psl_splicesites vcf_iit).each do |file_executable|
  describe command("which #{file_executable}") do
    its(:exit_status) { should eq 0 }
  end

  file_path = '/usr/local/bin/' + file_executable

  describe file(file_path) do
    it { should be_file }
    it { should be_executable }
  end
end
