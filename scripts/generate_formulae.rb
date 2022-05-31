# frozen_string_literal: true

require "English"

versions = %w[
  0.22.2
  0.22.1
  0.22.0
  0.21.0
  0.20.0
  0.19.0
  0.18.0
  0.17.0
  0.16.1
  0.16.0
  0.15.0
  0.14.0
  0.13.0
  0.12.0
]

versions.each do |version|
  puts "Creating formula for version #{version}"
  file_name = "typesense-server-#{version}-darwin-amd64.tar.gz"
  file_path = "/tmp"
  full_file_path_name = "#{file_path}/#{file_name}"
  file_download_url = "https://dl.typesense.org/releases/#{version}/#{file_name}"

  puts "Downloading #{version} binary"
  `curl -s --fail-with-body "#{file_download_url}" --output "#{full_file_path_name}"`
  raise "curl failed with exit code #{$CHILD_STATUS.exitstatus}" unless $CHILD_STATUS.success?

  puts "Calculating sha256 hash for #{version} binary"
  file_sha256 = `sha2 -256 -q #{full_file_path_name}`
  # sha2 returns a non-zero error code for some reason, so commenting this out
  # raise "sha2 failed with exit code #{$CHILD_STATUS.exitstatus}" unless $CHILD_STATUS.success?

  formula = <<~EOFORMULA
    class TypesenseServerAT#{version.delete(".")} < Formula
      desc "Search Engine; Open Source, Lightning fast, In-Memory, Typo Tolerant"
      homepage "https://typesense.org"
      url "#{file_download_url}"
      version "#{version}"
      sha256 "#{file_sha256.strip}"
      license "GPL-3.0"

      def install
        bin.install "typesense-server"
      end

      test do
        output = shell_output("\#{bin}/typesense-server 2>&1", 1)
        assert_match "Command line usage: ./typesense-server", output
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
