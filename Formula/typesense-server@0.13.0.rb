class TypesenseServerAT0130 < Formula
  desc "Search Engine; Open Source, Lightning fast, In-Memory, Typo Tolerant"
  homepage "https://typesense.org"
  version "0.13.0"
  url "https://dl.typesense.org/releases/0.13.0/typesense-server-0.13.0-darwin-amd64.tar.gz"
  sha256 "a721102537ed5715dea849ac14b478c5840e9ab6bd0d4548e3652cfe88cfa827"
  license "GPL-3.0"

  def install
    bin.install "typesense-server"
  end
end
