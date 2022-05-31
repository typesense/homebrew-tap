class TypesenseServerAT0220 < Formula
  desc "Search Engine; Open Source, Lightning fast, In-Memory, Typo Tolerant"
  homepage "https://typesense.org"
  version "0.22.0"
  url "https://dl.typesense.org/releases/0.22.0/typesense-server-0.22.0-darwin-amd64.tar.gz"
  sha256 "820bf71370f694d8478b15a5b23c00652cd05a0daf62d2f8094c2093083bfc51"
  license "GPL-3.0"

  def install
    bin.install "typesense-server"
  end

  test do
    output = shell_output("#{bin}/typesense-server 2>&1", 1)
    assert_match "Command line usage: ./typesense-server", output
  end
end
