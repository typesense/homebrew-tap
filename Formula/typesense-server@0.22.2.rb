class TypesenseServerAT0222 < Formula
  desc "Search Engine; Open Source, Lightning fast, In-Memory, Typo Tolerant"
  homepage "https://typesense.org"
  version "0.22.2"
  url "https://dl.typesense.org/releases/#{version}/typesense-server-#{version}-darwin-amd64.tar.gz"
  sha256 "49cf34fc759a7e2fc8f78cb2b7ed3fbec195ec0fb33495faa3aca0825335b956"
  license "GPL-3.0"

  def install
    bin.install "typesense-server"
  end
end
