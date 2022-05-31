class TypesenseServerAT0150 < Formula
  desc "Search Engine; Open Source, Lightning fast, In-Memory, Typo Tolerant"
  homepage "https://typesense.org"
  url "https://dl.typesense.org/releases/0.15.0/typesense-server-0.15.0-darwin-amd64.tar.gz"
  version "0.15.0"
  sha256 "39fe7ba938ed2951930ec6efc9a58aebceac711de1a20ffd488da7ce8ccf16a5"
  license "GPL-3.0"

  def install
    bin.install "typesense-server"
  end

  test do
    output = shell_output("#{bin}/typesense-server 2>&1", 1)
    assert_match "Command line usage: ./typesense-server", output
  end
end
