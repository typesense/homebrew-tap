class TypesenseServerAT0140 < Formula
  desc "Search Engine; Open Source, Lightning fast, In-Memory, Typo Tolerant"
  homepage "https://typesense.org"
  version "0.14.0"
  url "https://dl.typesense.org/releases/0.14.0/typesense-server-0.14.0-darwin-amd64.tar.gz"
  sha256 "7982a9c9dcbc202b34523b6cf736bce858689c05083647d1bdc0afb4a6321393"
  license "GPL-3.0"

  def install
    bin.install "typesense-server"
  end

  test do
    output = shell_output("#{bin}/typesense-server 2>&1", 1)
    assert_match "Command line usage: ./typesense-server", output
  end
end
