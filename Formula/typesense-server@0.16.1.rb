class TypesenseServerAT0161 < Formula
  desc "Search Engine; Open Source, Lightning fast, In-Memory, Typo Tolerant"
  homepage "https://typesense.org"
  url "https://dl.typesense.org/releases/0.16.1/typesense-server-0.16.1-darwin-amd64.tar.gz"  
  version "0.16.1"
  sha256 "8b4d5eed8c282da65e29cad17132436e9bf9d34a306ad3b4abce4bff66e7e23b"
  license "GPL-3.0"

  def install
    bin.install "typesense-server"
  end

  test do
    output = shell_output("#{bin}/typesense-server 2>&1", 1)
    assert_match "Command line usage: ./typesense-server", output
  end
end
