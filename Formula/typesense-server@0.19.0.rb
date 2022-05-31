class TypesenseServerAT0190 < Formula
  desc "Search Engine; Open Source, Lightning fast, In-Memory, Typo Tolerant"
  homepage "https://typesense.org"
  version "0.19.0"
  url "https://dl.typesense.org/releases/0.19.0/typesense-server-0.19.0-darwin-amd64.tar.gz"
  sha256 "55ec38b55a4fa8a2af77c56cabfff02e1fce0efe7bd362bf1f211f481b897e57"
  license "GPL-3.0"

  def install
    bin.install "typesense-server"
  end
end
