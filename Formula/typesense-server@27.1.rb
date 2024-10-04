class TypesenseServerAT271 < Formula
  desc "Search Engine; Open Source, Lightning fast, In-Memory, Typo Tolerant"
  homepage "https://typesense.org"
  version "27.1"
  license "GPL-3.0"

  if Hardware::CPU.arm?
    url "https://dl.typesense.org/releases/27.1/typesense-server-27.1-darwin-arm64.tar.gz"
    sha256 "ef478f0a932f38ded3de46de7919a4a90809cc480d344d16ed5a5c6a9ccb177e"
  else
    url "https://dl.typesense.org/releases/27.1/typesense-server-27.1-darwin-amd64.tar.gz"
    sha256 "6bca78ffe7423b2c76fec961ca758983a32cc0c891f583f4d59aeb8e47c085e1"
  end

  def install
    bin.install "typesense-server"

    # Create directories
    [data_dir, config_dir, log_dir, analytics_dir].each(&:mkpath)

    # Create default config file
    config_file_contents = <<~EOF
      [server]
      api-address = 0.0.0.0
      api-port = 8108
      api-key = xyz
      data-dir = #{data_dir}
      log-dir = #{log_dir}
      enable-search-analytics = true
      analytics-flush-interval = 60
      analytics-dir = #{analytics_dir}
      enable-cors = true
    EOF
    system "echo '#{config_file_contents}' > #{buildpath/"typesense.ini"}"
    config_dir.install "typesense.ini"
  end

  def caveats
    msg = <<~EOS
      * The default admin API key is xyz
      * The default API port is 8108
      * Config file is at: #{config_dir/"typesense.ini"}
      * Logs are under: #{log_dir}
      * Data dir is under: #{data_dir}
      * To test that Typesense is running, try running curl http://localhost:8108/health
    EOS

    on_macos do
      if MacOS.version < :ventura
        msg = <<~EOS
          #{msg}
          *************************************************************************************************
          * NOTE: The macOS Intel build of Typesense is only supported on macOS Venture (13.x) or above.
          *  For other macOS versions, please use the Docker installation method described here:
          *    https://typesense.org/docs/guide/install-typesense.html#docker
          *************************************************************************************************
        EOS
      end
    end

    msg
  end

  service do
    run [opt_bin/"typesense-server", "--config=#{etc/"typesense/typesense.ini"}"]
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

  def analytics_dir
    var/"lib/typesense/analytics"
  end

  def log_dir
    var/"log/typesense"
  end

  test do
    output = shell_output("#{bin}/typesense-server 2>&1", 1)
    assert_match "Command line usage: ./typesense-server", output
  end
end
