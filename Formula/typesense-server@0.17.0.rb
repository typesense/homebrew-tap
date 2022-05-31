class TypesenseServerAT0170 < Formula
  desc "Search Engine; Open Source, Lightning fast, In-Memory, Typo Tolerant"
  homepage "https://typesense.org"
  url "https://dl.typesense.org/releases/0.17.0/typesense-server-0.17.0-darwin-amd64.tar.gz"
  version "0.17.0"
  sha256 "cd09eac69e792a5936ba0c288a91f3b0e93818144e5ae1b5029f8ffc23b24ddf"
  license "GPL-3.0"

  def install
    bin.install "typesense-server"
  end

  test do
    output = shell_output("#{bin}/typesense-server 2>&1", 1)
    assert_match "Command line usage: ./typesense-server", output
  end
end
