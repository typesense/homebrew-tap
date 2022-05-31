class TypesenseServerAT0200 < Formula
  desc "Search Engine; Open Source, Lightning fast, In-Memory, Typo Tolerant"
  homepage "https://typesense.org"
  version "0.20.0"
  url "https://dl.typesense.org/releases/0.20.0/typesense-server-0.20.0-darwin-amd64.tar.gz"
  sha256 "554f1d189a8e2ff494c516b7625adec271e15229702062ef4684924b2d7fe737"
  license "GPL-3.0"

  def install
    bin.install "typesense-server"
  end
end
