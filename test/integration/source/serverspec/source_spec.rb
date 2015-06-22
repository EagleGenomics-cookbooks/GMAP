require 'serverspec'
require_relative 'spec_helper'

# Required by serverspec
set :backend, :exec

describe command('which gmap') do
  its(:exit_status) { should eq 0 }
end

describe command('gmap --version') do
  its(:stdout) { should match(/Part of GMAP package, version 2013-11-27/) }
end

['atoiindex', 'cmetindex', 'dbsnp_iit', 'ensembl_genes', 'fa_coords', 'get-genome', 'gff3_genes',
 'gff3_introns', 'gff3_splicesites', 'gmap', 'gmap_build', 'gmap_compress', 'gmapindex', 'gmapl',
 'gmap_process', 'gmap_reassemble', 'gmap_uncompress', 'gsnap', 'gsnapl', 'gtf_genes',
 'gtf_introns', 'gtf_splicesites', 'gvf_iit', 'iit_dump', 'iit_get', 'iit_store', 'md_coords',
 'psl_genes', 'psl_introns', 'psl_splicesites', 'snpindex', 'uniqscan', 'uniqscanl',
 'vcf_iit'].each do |file_executable|
  describe command("which #{file_executable}") do
    its(:exit_status) { should eq 0 }
  end

  file_path = '/usr/local/bin/' + file_executable

  describe file(file_path) do
    it { should be_file }
    it { should be_executable }
  end
end
