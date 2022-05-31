class TypesenseServerAT0161 < Formula
  desc "Search Engine; Open Source, Lightning fast, In-Memory, Typo Tolerant"
  homepage "https://typesense.org"
  version "0.16.1"
  url "https://dl.typesense.org/releases/0.16.1/typesense-server-0.16.1-darwin-amd64.tar.gz"
  sha256 "8b4d5eed8c282da65e29cad17132436e9bf9d34a306ad3b4abce4bff66e7e23b"
  license "GPL-3.0"

  def install
    bin.install "typesense-server"
  end
end
