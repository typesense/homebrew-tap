class TypesenseServerAT0190 < Formula
  desc "Search Engine; Open Source, Lightning fast, In-Memory, Typo Tolerant"
  homepage "https://typesense.org"
  url "https://dl.typesense.org/releases/0.19.0/typesense-server-0.19.0-darwin-amd64.tar.gz"  
  version "0.19.0"
  sha256 "55ec38b55a4fa8a2af77c56cabfff02e1fce0efe7bd362bf1f211f481b897e57"
  license "GPL-3.0"

  def install
    bin.install "typesense-server"
  end

  test do
    output = shell_output("#{bin}/typesense-server 2>&1", 1)
    assert_match "Command line usage: ./typesense-server", output
  end
end
