versions = %w[0.22.2 0.21.0]

versions.each do |version|
  puts "Creating formula for version #{version}"
  file_name = "typesense-server-#{version}-darwin-amd64.tar.gz"
  file_path = '/tmp'
  full_file_path_name = "#{file_path}/#{file_name}"
  file_download_url = "https://dl.typesense.org/releases/#{version}/#{file_name}"
  
  puts "Downloading #{version} binary"
  `curl -s --fail-with-body "#{file_download_url}" --output "#{full_file_path_name}"`
  raise "curl failed with exit code #{$?.exitstatus}" unless $?.success?
  
  puts "Calculating sha256 hash for #{version} binary"
  file_sha256 = `sha2 -256 -q #{full_file_path_name}`
  # sha2 returns a non-zero error code for some reason, so commenting this out
  # raise "sha2 failed with exit code #{$?.exitstatus}" unless $?.success? 
  
  formula = <<EOFORMULA
class TypesenseServerAT#{version.gsub('.', '')} < Formula
  desc "Search Engine; Open Source, Lightning fast, In-Memory, Typo Tolerant"
  homepage "https://typesense.org"
  version "#{version}"
  url "#{file_download_url}"
  sha256 "#{file_sha256.strip}"
  license "GPL-3.0"

  def install
    bin.install "typesense-server"
  end
end
EOFORMULA

  puts "Upserting Formula/typesense-server@#{version}.rb"
  File.write("Formula/typesense-server@#{version}.rb", formula)
  
  puts "---"
end

puts "Updating symlink for typesense-server to point to #{versions.first}"
`ln -sf ../Formula/typesense-server@#{versions.first}.rb Aliases/typesense-server`

puts "Done"
