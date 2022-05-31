class TypesenseServerAT0130 < Formula
  desc "Search Engine; Open Source, Lightning fast, In-Memory, Typo Tolerant"
  homepage "https://typesense.org"
  url "https://dl.typesense.org/releases/0.13.0/typesense-server-0.13.0-darwin-amd64.tar.gz"
  version "0.13.0"
  sha256 "a721102537ed5715dea849ac14b478c5840e9ab6bd0d4548e3652cfe88cfa827"
  license "GPL-3.0"

  def install
    bin.install "typesense-server"
  end

  test do
    output = shell_output("#{bin}/typesense-server 2>&1", 1)
    assert_match "Command line usage: ./typesense-server", output
  end
end
