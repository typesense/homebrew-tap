class TypesenseServerAT0170 < Formula
  desc "Search Engine; Open Source, Lightning fast, In-Memory, Typo Tolerant"
  homepage "https://typesense.org"
  url "https://dl.typesense.org/releases/0.17.0/typesense-server-0.17.0-darwin-amd64.tar.gz"
  version "0.17.0"
  sha256 "cd09eac69e792a5936ba0c288a91f3b0e93818144e5ae1b5029f8ffc23b24ddf"
  license "GPL-3.0"

  def install
    bin.install "typesense-server"

    # Create directories
    [data_dir, config_dir, log_dir].each(&:mkpath)

    # Create default config file
    config_file_contents = <<~EOF
      [server]
      api-address = 0.0.0.0
      api-port = 8108
      api-key = xyz
      data-dir = #{data_dir}
      log-dir = #{log_dir}
      enable-cors = true
    EOF
    system "echo '#{config_file_contents}' > #{buildpath/"typesense.ini"}"
    config_dir.install "typesense.ini"
  end

  def caveats
    <<~EOS
      * The default admin API key is xyz
        The default API port is 8108
            You can change these and other configuration by editing #{config_dir/"typesense.ini"}
      * Logs are under: #{log_dir}
      * Data dir is under: #{data_dir}
      * To test that Typesense is running, try
            curl http://localhost:8108/health
    EOS
  end

  service do
    run [bin/"typesense-server", "--config=#{etc/"typesense/typesense.ini"}"]
    keep_alive true
    error_log_path var/"log/typesense.log"
    log_path var/"log/typesense.log"
    working_dir var/"lib/typesense"
  end

  def config_dir
    etc/"typesense"
  end

  def data_dir
    var/"lib/typesense"
  end

  def log_dir
    var/"log/typesense"
  end

  test do
    output = shell_output("#{bin}/typesense-server 2>&1", 1)
    assert_match "Command line usage: ./typesense-server", output
  end
end
