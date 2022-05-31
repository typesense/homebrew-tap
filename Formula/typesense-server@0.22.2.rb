class TypesenseServerAT0222 < Formula
  desc "Search Engine; Open Source, Lightning fast, In-Memory, Typo Tolerant"
  homepage "https://typesense.org"
  url "https://dl.typesense.org/releases/0.22.2/typesense-server-0.22.2-darwin-amd64.tar.gz"  
  version "0.22.2"
  sha256 "49cf34fc759a7e2fc8f78cb2b7ed3fbec195ec0fb33495faa3aca0825335b956"
  license "GPL-3.0"

  def install
    bin.install "typesense-server"
  end

  test do
    output = shell_output("#{bin}/typesense-server 2>&1", 1)
    assert_match "Command line usage: ./typesense-server", output
  end
end
