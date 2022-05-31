class TypesenseServerAT0200 < Formula
  desc "Search Engine; Open Source, Lightning fast, In-Memory, Typo Tolerant"
  homepage "https://typesense.org"
  url "https://dl.typesense.org/releases/0.20.0/typesense-server-0.20.0-darwin-amd64.tar.gz"  
  version "0.20.0"
  sha256 "554f1d189a8e2ff494c516b7625adec271e15229702062ef4684924b2d7fe737"
  license "GPL-3.0"

  def install
    bin.install "typesense-server"
  end

  test do
    output = shell_output("#{bin}/typesense-server 2>&1", 1)
    assert_match "Command line usage: ./typesense-server", output
  end
end
