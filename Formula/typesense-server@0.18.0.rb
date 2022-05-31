class TypesenseServerAT0180 < Formula
  desc "Search Engine; Open Source, Lightning fast, In-Memory, Typo Tolerant"
  homepage "https://typesense.org"
  url "https://dl.typesense.org/releases/0.18.0/typesense-server-0.18.0-darwin-amd64.tar.gz"  
  version "0.18.0"
  sha256 "2ac1863d889a0c2d40b078ad5bac4777794af5384d4dd8a4ee0d2074659159d2"
  license "GPL-3.0"

  def install
    bin.install "typesense-server"
  end

  test do
    output = shell_output("#{bin}/typesense-server 2>&1", 1)
    assert_match "Command line usage: ./typesense-server", output
  end
end
