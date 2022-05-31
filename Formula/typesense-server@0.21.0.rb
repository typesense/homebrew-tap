class TypesenseServerAT0210 < Formula
  desc "Search Engine; Open Source, Lightning fast, In-Memory, Typo Tolerant"
  homepage "https://typesense.org"
  url "https://dl.typesense.org/releases/0.21.0/typesense-server-0.21.0-darwin-amd64.tar.gz"
  version "0.21.0"
  sha256 "9b0d01c55a0eb865fb33ee46094a87bc51f11150c0ee14a7c39a0bbe500455ee"
  license "GPL-3.0"

  def install
    bin.install "typesense-server"
  end

  test do
    output = shell_output("#{bin}/typesense-server 2>&1", 1)
    assert_match "Command line usage: ./typesense-server", output
  end
end
