class TypesenseServerAT0221 < Formula
  desc "Search Engine; Open Source, Lightning fast, In-Memory, Typo Tolerant"
  homepage "https://typesense.org"
  url "https://dl.typesense.org/releases/0.22.1/typesense-server-0.22.1-darwin-amd64.tar.gz"
  version "0.22.1"
  sha256 "0aefe5c18bb9d5a1dd5b58df6d0a85e6ade6e02239173ede8e9e2f1c3b1b7566"
  license "GPL-3.0"

  def install
    bin.install "typesense-server"
  end

  test do
    output = shell_output("#{bin}/typesense-server 2>&1", 1)
    assert_match "Command line usage: ./typesense-server", output
  end
end
