class TypesenseServerAT0120 < Formula
  desc "Search Engine; Open Source, Lightning fast, In-Memory, Typo Tolerant"
  homepage "https://typesense.org"
  version "0.12.0"
  url "https://dl.typesense.org/releases/0.12.0/typesense-server-0.12.0-darwin-amd64.tar.gz"
  sha256 "159b801d4d7393057f769d6bc5e6d638aeba6ed2e4358b369b7226db210949b8"
  license "GPL-3.0"

  def install
    bin.install "typesense-server"
  end
end
