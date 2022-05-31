class TypesenseServerAT0160 < Formula
  desc "Search Engine; Open Source, Lightning fast, In-Memory, Typo Tolerant"
  homepage "https://typesense.org"
  url "https://dl.typesense.org/releases/0.16.0/typesense-server-0.16.0-darwin-amd64.tar.gz"
  version "0.16.0"
  sha256 "f37afe13ca83470519d0f9588ce3e5b58448ef2fda9b1a0ea536bb39acb0f30b"
  license "GPL-3.0"

  def install
    bin.install "typesense-server"
  end

  test do
    output = shell_output("#{bin}/typesense-server 2>&1", 1)
    assert_match "Command line usage: ./typesense-server", output
  end
end
