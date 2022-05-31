class TypesenseServerAT0150 < Formula
  desc "Search Engine; Open Source, Lightning fast, In-Memory, Typo Tolerant"
  homepage "https://typesense.org"
  version "0.15.0"
  url "https://dl.typesense.org/releases/0.15.0/typesense-server-0.15.0-darwin-amd64.tar.gz"
  sha256 "39fe7ba938ed2951930ec6efc9a58aebceac711de1a20ffd488da7ce8ccf16a5"
  license "GPL-3.0"

  def install
    bin.install "typesense-server"
  end
end
