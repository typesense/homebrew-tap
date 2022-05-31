class TypesenseServerAT0170 < Formula
  desc "Search Engine; Open Source, Lightning fast, In-Memory, Typo Tolerant"
  homepage "https://typesense.org"
  version "0.17.0"
  url "https://dl.typesense.org/releases/0.17.0/typesense-server-0.17.0-darwin-amd64.tar.gz"
  sha256 "cd09eac69e792a5936ba0c288a91f3b0e93818144e5ae1b5029f8ffc23b24ddf"
  license "GPL-3.0"

  def install
    bin.install "typesense-server"
  end
end
